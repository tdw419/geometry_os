; DESCRIPTION: Places a white line segment connecting (423, 203) to (319, 217).
; PLAN: r0=423(x1), r1=203(y1), r2=319(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 203
LDI r2, 319
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
