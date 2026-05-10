; DESCRIPTION: Draws a cyan horizontal line across the screen at y=155.
; PLAN: r0x1), r1=14(y1), r2=15(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 14
LDI r2, 15
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
