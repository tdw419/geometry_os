; DESCRIPTION: Draws a yellow line from (174, 64) to (253, 232).
; PLAN: r0=174(x1), r1=64(y1), r2=253(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 64
LDI r2, 253
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
