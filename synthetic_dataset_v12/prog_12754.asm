; DESCRIPTION: Places a blue line segment connecting (413, 241) to (235, 116).
; PLAN: r0=413(x1), r1=241(y1), r2=235(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 241
LDI r2, 235
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
