; DESCRIPTION: Draws a yellow line from (6, 105) to (153, 86).
; PLAN: r0=6(x1), r1=105(y1), r2=153(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 105
LDI r2, 153
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
