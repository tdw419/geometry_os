; DESCRIPTION: Places a white line segment connecting (299, 140) to (98, 191).
; PLAN: r0=299(x1), r1=140(y1), r2=98(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 140
LDI r2, 98
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
