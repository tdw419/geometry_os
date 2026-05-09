; DESCRIPTION: Renders a magenta line between points (212, 165) and (253, 115).
; PLAN: r0=212(x1), r1=165(y1), r2=253(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 165
LDI r2, 253
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
