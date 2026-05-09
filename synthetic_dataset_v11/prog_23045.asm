; DESCRIPTION: Places a black line segment connecting (5, 103) to (195, 203).
; PLAN: r0=5(x1), r1=103(y1), r2=195(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 103
LDI r2, 195
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
