; DESCRIPTION: Places a purple line segment connecting (160, 185) to (126, 156).
; PLAN: r0=160(x1), r1=185(y1), r2=126(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 185
LDI r2, 126
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
