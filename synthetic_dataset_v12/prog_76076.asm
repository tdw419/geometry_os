; DESCRIPTION: Draws a yellow line from (104, 181) to (109, 199).
; PLAN: r0=104(x1), r1=181(y1), r2=109(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 181
LDI r2, 109
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
