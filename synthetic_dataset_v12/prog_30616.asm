; DESCRIPTION: Places a purple line segment connecting (132, 79) to (351, 125).
; PLAN: r0=132(x1), r1=79(y1), r2=351(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 79
LDI r2, 351
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
