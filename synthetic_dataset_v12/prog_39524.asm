; DESCRIPTION: Renders a yellow line between points (274, 165) and (481, 186).
; PLAN: r0=274(x1), r1=165(y1), r2=481(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 165
LDI r2, 481
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
