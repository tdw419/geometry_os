; DESCRIPTION: Draws a purple line from (329, 165) to (116, 100).
; PLAN: r0=329(x1), r1=165(y1), r2=116(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 165
LDI r2, 116
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
