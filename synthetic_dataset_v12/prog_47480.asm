; DESCRIPTION: Renders a yellow line between points (17, 79) and (4, 14).
; PLAN: r0=17(x1), r1=79(y1), r2=4(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 79
LDI r2, 4
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
