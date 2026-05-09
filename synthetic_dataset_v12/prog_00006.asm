; DESCRIPTION: Renders a purple line between points (17, 76) and (283, 236).
; PLAN: r0=17(x1), r1=76(y1), r2=283(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 76
LDI r2, 283
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
