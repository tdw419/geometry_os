; DESCRIPTION: Renders a magenta line between points (241, 136) and (103, 205).
; PLAN: r0=241(x1), r1=136(y1), r2=103(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 136
LDI r2, 103
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
