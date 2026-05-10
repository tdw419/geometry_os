; DESCRIPTION: Renders a white line between points (451, 178) and (203, 119).
; PLAN: r0=451(x1), r1=178(y1), r2=203(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 178
LDI r2, 203
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
