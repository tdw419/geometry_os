; DESCRIPTION: Places a purple line segment connecting (132, 153) to (128, 235).
; PLAN: r0=132(x1), r1=153(y1), r2=128(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 153
LDI r2, 128
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
