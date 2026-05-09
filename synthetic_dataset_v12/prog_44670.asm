; DESCRIPTION: Places a blue line segment connecting (340, 203) to (7, 18).
; PLAN: r0=340(x1), r1=203(y1), r2=7(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 203
LDI r2, 7
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
