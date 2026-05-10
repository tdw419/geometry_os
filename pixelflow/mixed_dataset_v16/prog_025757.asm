; DESCRIPTION: Renders a blue line between points (376, 104) and (351, 189).
; PLAN: r0=376(x1), r1=104(y1), r2=351(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 104
LDI r2, 351
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
