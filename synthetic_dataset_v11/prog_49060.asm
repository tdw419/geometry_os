; DESCRIPTION: Renders a yellow line between points (165, 175) and (22, 189).
; PLAN: r0=165(x1), r1=175(y1), r2=22(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 175
LDI r2, 22
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
