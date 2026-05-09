; DESCRIPTION: Renders a yellow line between points (109, 189) and (32, 29).
; PLAN: r0=109(x1), r1=189(y1), r2=32(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 189
LDI r2, 32
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
