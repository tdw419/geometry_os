; DESCRIPTION: Places a white line segment connecting (328, 203) to (310, 17).
; PLAN: r0=328(x1), r1=203(y1), r2=310(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 203
LDI r2, 310
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
