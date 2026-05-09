; DESCRIPTION: Renders a yellow line between points (27, 9) and (339, 123).
; PLAN: r0=27(x1), r1=9(y1), r2=339(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 9
LDI r2, 339
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
