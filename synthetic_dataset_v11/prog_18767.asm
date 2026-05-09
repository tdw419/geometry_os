; DESCRIPTION: Places a purple line segment connecting (235, 151) to (28, 188).
; PLAN: r0=235(x1), r1=151(y1), r2=28(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 151
LDI r2, 28
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
