; DESCRIPTION: Renders a magenta line between points (396, 147) and (316, 232).
; PLAN: r0=396(x1), r1=147(y1), r2=316(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 147
LDI r2, 316
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
