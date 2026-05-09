; DESCRIPTION: Renders a white line between points (203, 9) and (430, 227).
; PLAN: r0=203(x1), r1=9(y1), r2=430(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 9
LDI r2, 430
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
