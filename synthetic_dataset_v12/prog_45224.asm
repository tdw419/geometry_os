; DESCRIPTION: Renders a yellow line between points (67, 23) and (138, 138).
; PLAN: r0=67(x1), r1=23(y1), r2=138(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 23
LDI r2, 138
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
