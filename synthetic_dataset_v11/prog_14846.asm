; DESCRIPTION: Places a white line segment connecting (122, 176) to (135, 191).
; PLAN: r0=122(x1), r1=176(y1), r2=135(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 176
LDI r2, 135
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
