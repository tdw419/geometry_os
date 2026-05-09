; DESCRIPTION: Renders a white line between points (31, 243) and (203, 137).
; PLAN: r0=31(x1), r1=243(y1), r2=203(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 243
LDI r2, 203
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
