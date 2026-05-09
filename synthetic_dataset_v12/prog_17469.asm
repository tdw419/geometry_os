; DESCRIPTION: Places a purple line segment connecting (141, 188) to (361, 214).
; PLAN: r0=141(x1), r1=188(y1), r2=361(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 188
LDI r2, 361
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
