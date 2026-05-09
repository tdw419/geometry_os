; DESCRIPTION: Draws a yellow line from (462, 237) to (88, 99).
; PLAN: r0=462(x1), r1=237(y1), r2=88(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 237
LDI r2, 88
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
