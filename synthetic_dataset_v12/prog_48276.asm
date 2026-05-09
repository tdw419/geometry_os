; DESCRIPTION: Places a orange line segment connecting (294, 134) to (377, 203).
; PLAN: r0=294(x1), r1=134(y1), r2=377(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 134
LDI r2, 377
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
