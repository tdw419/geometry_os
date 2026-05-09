; DESCRIPTION: Places a purple line segment connecting (165, 235) to (234, 4).
; PLAN: r0=165(x1), r1=235(y1), r2=234(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 235
LDI r2, 234
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
