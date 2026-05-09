; DESCRIPTION: Places a purple line segment connecting (379, 171) to (213, 83).
; PLAN: r0=379(x1), r1=171(y1), r2=213(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 171
LDI r2, 213
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
