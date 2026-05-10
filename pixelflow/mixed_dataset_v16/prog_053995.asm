; DESCRIPTION: Places a purple line segment connecting (143, 248) to (503, 83).
; PLAN: r0=143(x1), r1=248(y1), r2=503(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 248
LDI r2, 503
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
