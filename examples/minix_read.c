/* Simplified Minix v2 read -- proof of concept for GEO-47.
 *
 * Reads inode #1 from a fixed-layout test disk image.
 * Disk layout (4 blocks of 512 bytes):
 *   Block 1 (offset 512): superblock, magic=0x2468 at byte 14
 *   Block 3 (offset 1536): inode #1: size at +4, zone[0] at +28
 *   Block 4 (offset 2048): file data "HELLO"
 *
 * All parameters passed in registers:
 *   r0 = disk image base address (byte addr in VM memory)
 *   r1 = result buffer address (byte addr in VM memory)
 * Returns bytes read in r0.
 */

unsigned int minix_read(unsigned int disk, unsigned int result) {
    unsigned int sb_off;
    unsigned int inode_off;
    unsigned int data_off;
    unsigned int file_size;
    unsigned int zone_num;
    unsigned int i;
    unsigned char b;

    /* Check superblock magic at disk+512+14 (2 bytes, little-endian) */
    sb_off = disk + 526;
    b = *((unsigned char *)(sb_off));
    if (b != 104) { return 0; }  /* 0x68 = 104 */

    b = *((unsigned char *)(sb_off + 1));
    if (b != 36) { return 0; }   /* 0x24 = 36 */

    /* Inode #1: at disk + (2+1+1)*512 + 0*64 = disk + 2048 */
    inode_off = disk + 2048;

    /* Read i_size at inode_off + 4 */
    file_size = *((unsigned int *)(inode_off + 4));

    /* Read zone[0] at inode_off + 28 */
    zone_num = *((unsigned int *)(inode_off + 28));

    /* Data at disk + zone_num * 512 */
    data_off = disk + zone_num * 512;

    /* Copy file_size bytes */
    i = 0;
    while (i < file_size) {
        b = *((unsigned char *)(data_off + i));
        *((unsigned char *)(result + i)) = b;
        i = i + 1;
    }

    return file_size;
}
