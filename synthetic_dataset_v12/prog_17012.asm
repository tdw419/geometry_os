; DESCRIPTION: Renders a yellow line between points (334, 138) and (499, 123).
; PLAN: r0=334(x1), r1=138(y1), r2=499(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 138
LDI r2, 499
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
