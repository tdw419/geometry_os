; DESCRIPTION: Draws a green line from (371, 155) to (253, 189).
; PLAN: r0=371(x1), r1=155(y1), r2=253(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 155
LDI r2, 253
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
