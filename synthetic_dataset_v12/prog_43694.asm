; DESCRIPTION: Places a white line segment connecting (171, 63) to (97, 22).
; PLAN: r0=171(x1), r1=63(y1), r2=97(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 63
LDI r2, 97
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
