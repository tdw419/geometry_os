; DESCRIPTION: Places a black line segment connecting (204, 225) to (361, 179).
; PLAN: r0=204(x1), r1=225(y1), r2=361(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 225
LDI r2, 361
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
