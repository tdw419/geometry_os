; DESCRIPTION: Renders a red line between points (17, 94) and (219, 138).
; PLAN: r0=17(x1), r1=94(y1), r2=219(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 94
LDI r2, 219
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
