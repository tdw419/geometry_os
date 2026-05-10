; DESCRIPTION: Places a white line segment connecting (78, 9) to (340, 176).
; PLAN: r0=78(x1), r1=9(y1), r2=340(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 9
LDI r2, 340
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
