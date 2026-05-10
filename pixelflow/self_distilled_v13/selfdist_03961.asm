; DESCRIPTION: Draws a cyan horizontal line across the screen at y=153.
; PLAN: r0x1), r1=18(y1), r2=15(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 18
LDI r2, 15
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
