; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).$ 4
LDI r30, 0xFF00

LDI r3, 0x00FF00

LDI r2, 0x00000
LDI r1, 0xFFFFF
LDI r3, 1
LDI r4, 0x00000
CALL color_wait

RAND r1
LDI r2, 0x00FF00
STORE r2, r1
CALL write_state

main_loop:
RAND r9
LDI r2, 0xFF
AND r9, r2
STORE r3, r9
CALL write_patte
JMP main_loop

HALT