; DESCRIPTION: Places a white line segment connecting (12, 72) to (426, 211).
; PLAN: r0=12(x1), r1=72(y1), r2=426(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 72
LDI r2, 426
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
