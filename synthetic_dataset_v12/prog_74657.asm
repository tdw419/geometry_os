; DESCRIPTION: Renders a yellow line between points (241, 27) and (100, 136).
; PLAN: r0=241(x1), r1=27(y1), r2=100(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 27
LDI r2, 100
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
