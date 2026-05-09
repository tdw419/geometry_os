; DESCRIPTION: Places a yellow line segment connecting (281, 203) to (194, 69).
; PLAN: r0=281(x1), r1=203(y1), r2=194(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 203
LDI r2, 194
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
