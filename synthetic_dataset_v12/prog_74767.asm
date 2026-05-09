; DESCRIPTION: Renders a yellow line between points (278, 151) and (339, 5).
; PLAN: r0=278(x1), r1=151(y1), r2=339(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 151
LDI r2, 339
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
