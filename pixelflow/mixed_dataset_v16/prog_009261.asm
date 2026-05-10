; DESCRIPTION: Renders a yellow line between points (17, 203) and (367, 145).
; PLAN: r0=17(x1), r1=203(y1), r2=367(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 203
LDI r2, 367
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
