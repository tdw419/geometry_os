; DESCRIPTION: Renders a white line between points (78, 17) and (474, 97).
; PLAN: r0=78(x1), r1=17(y1), r2=474(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 17
LDI r2, 474
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
