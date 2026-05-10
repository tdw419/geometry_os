; DESCRIPTION: Draws a cyan horizontal line across the screen at y=101.
; PLAN: r0x1), r1=10(y1), r2=1(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 10
LDI r2, 1
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
