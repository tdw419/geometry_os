; DESCRIPTION: Places a white line segment connecting (433, 203) to (478, 49).
; PLAN: r0=433(x1), r1=203(y1), r2=478(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 203
LDI r2, 478
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
