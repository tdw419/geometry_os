; DESCRIPTION: Places a orange line segment connecting (195, 185) to (230, 203).
; PLAN: r0=195(x1), r1=185(y1), r2=230(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 185
LDI r2, 230
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
