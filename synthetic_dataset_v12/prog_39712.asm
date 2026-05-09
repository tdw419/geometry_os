; DESCRIPTION: Draws a purple line from (463, 53) to (189, 224).
; PLAN: r0=463(x1), r1=53(y1), r2=189(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 53
LDI r2, 189
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
