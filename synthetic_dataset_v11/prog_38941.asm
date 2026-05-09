; DESCRIPTION: Renders a yellow line between points (237, 77) and (17, 114).
; PLAN: r0=237(x1), r1=77(y1), r2=17(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 77
LDI r2, 17
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
