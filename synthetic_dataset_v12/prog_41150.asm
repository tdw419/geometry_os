; DESCRIPTION: Draws a yellow line from (112, 18) to (236, 222).
; PLAN: r0=112(x1), r1=18(y1), r2=236(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 18
LDI r2, 236
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
