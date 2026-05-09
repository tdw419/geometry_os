; DESCRIPTION: Places a white line segment connecting (33, 249) to (185, 203).
; PLAN: r0=33(x1), r1=249(y1), r2=185(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 249
LDI r2, 185
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
