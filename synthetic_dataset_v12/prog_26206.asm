; DESCRIPTION: Places a orange line segment connecting (142, 37) to (243, 203).
; PLAN: r0=142(x1), r1=37(y1), r2=243(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 37
LDI r2, 243
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
