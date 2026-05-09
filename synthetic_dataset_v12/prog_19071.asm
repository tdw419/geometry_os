; DESCRIPTION: Places a magenta line segment connecting (351, 136) to (499, 68).
; PLAN: r0=351(x1), r1=136(y1), r2=499(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 136
LDI r2, 499
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
