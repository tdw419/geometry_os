; DESCRIPTION: Places a white line segment connecting (225, 203) to (147, 33).
; PLAN: r0=225(x1), r1=203(y1), r2=147(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 203
LDI r2, 147
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
