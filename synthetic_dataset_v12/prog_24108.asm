; DESCRIPTION: Renders a yellow line between points (9, 230) and (332, 10).
; PLAN: r0=9(x1), r1=230(y1), r2=332(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 230
LDI r2, 332
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
