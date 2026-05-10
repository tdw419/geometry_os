; DESCRIPTION: Places a yellow line segment connecting (27, 203) to (22, 122).
; PLAN: r0=27(x1), r1=203(y1), r2=22(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 203
LDI r2, 22
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
