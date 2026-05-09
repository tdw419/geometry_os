; DESCRIPTION: Draws a purple line from (189, 32) to (133, 214).
; PLAN: r0=189(x1), r1=32(y1), r2=133(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 32
LDI r2, 133
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
