; DESCRIPTION: Draws a purple line from (260, 255) to (299, 116).
; PLAN: r0=260(x1), r1=255(y1), r2=299(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 255
LDI r2, 299
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
