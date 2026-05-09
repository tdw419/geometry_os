; DESCRIPTION: Renders a magenta line between points (58, 141) and (147, 115).
; PLAN: r0=58(x1), r1=141(y1), r2=147(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 141
LDI r2, 147
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
