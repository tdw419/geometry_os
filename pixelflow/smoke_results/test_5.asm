; DESCRIPTION: Clears the screen to black and then halts. R 30
LDI r2, 0
ADD r2, r13
SHRI r2, 0xFF
SHLI r2, 16
OR r2, r2

PSET r1, r1, r2

ADDI r1, 1
CMPI r1, 256
BLT r0, vert_loop
JMP frame_end

yskip_loop:
LDI r1, 0x5500
LDI r2, 0x55010
LOAD r7, r1
SAR r7, r17
JNZ r7, skip_c1
ADDI r2, 1
JMP angle_screen
kip_crens:
LDI r2, 0x55000
LDI r2, 0x55020
STORE r2, r2
ADDI r1, 1
LDI r2, 0x55010
LOAD r7, r2
SAR r7, r17
SAR r7, r17
JZ r7, skip_crens
LDI r2, 0x5000
JMP skip_chars