; DESCRIPTION: Renders a yellow line between points (25, 184) and (152, 183).
; PLAN: r0=25(x1), r1=184(y1), r2=152(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 184
LDI r2, 152
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
