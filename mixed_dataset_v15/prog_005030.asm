; DESCRIPTION: Renders a magenta line segment connecting (351, 132) to (348, 84).
; PLAN: r0=351(x1), r1=132(y1), r2=348(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 132
LDI r2, 348
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
