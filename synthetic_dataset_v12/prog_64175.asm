; DESCRIPTION: Draws a green line from (179, 225) to (402, 189).
; PLAN: r0=179(x1), r1=225(y1), r2=402(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 225
LDI r2, 402
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
