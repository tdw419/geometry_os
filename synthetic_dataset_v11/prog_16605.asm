; DESCRIPTION: Places a yellow line segment connecting (124, 203) to (130, 63).
; PLAN: r0=124(x1), r1=203(y1), r2=130(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 203
LDI r2, 130
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
