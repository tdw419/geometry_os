; DESCRIPTION: Renders a black line between points (151, 217) and (97, 52).
; PLAN: r0=151(x1), r1=217(y1), r2=97(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 217
LDI r2, 97
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
