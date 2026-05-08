; 000_yellow_rect.asm - Yellow rectangle at (20, 20) to (100, 80)

LDI r0, 20
LDI r1, 20
LDI r2, 80
LDI r3, 60
LDI r4, 0xFFFF00

RECTF r0, r1, r2, r3, r4

HALT
