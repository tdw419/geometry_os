; DESCRIPTION: Renders a green line between points (118, 121) and (253, 156).
; PLAN: r0=118(x1), r1=121(y1), r2=253(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 121
LDI r2, 253
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
