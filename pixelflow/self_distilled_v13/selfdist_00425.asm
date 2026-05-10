; DESCRIPTION: Draws a cyan horizontal line across the screen at y=33.
; PLAN: r0x1), r1=13(y1), r2=3(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 13
LDI r2, 3
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
