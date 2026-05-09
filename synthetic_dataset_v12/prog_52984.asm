; DESCRIPTION: Renders a yellow line between points (0, 125) and (246, 165).
; PLAN: r0=0(x1), r1=125(y1), r2=246(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 125
LDI r2, 246
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
