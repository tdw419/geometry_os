; DESCRIPTION: Draws a cyan line from (24, 84) to (78, 147).
; PLAN: r0=24(x1), r1=84(y1), r2=78(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 84
LDI r2, 78
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
