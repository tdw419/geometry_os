; DESCRIPTION: Renders a yellow line between points (246, 125) and (63, 12).
; PLAN: r0=246(x1), r1=125(y1), r2=63(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 125
LDI r2, 63
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
