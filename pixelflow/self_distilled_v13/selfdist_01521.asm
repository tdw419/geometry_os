; DESCRIPTION: Draws a cyan horizontal line across the screen at y=36.
; PLAN: r0x1), r1=1(y1), r2=36(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 1
LDI r2, 36
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
