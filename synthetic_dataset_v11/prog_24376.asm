; DESCRIPTION: Renders a magenta line between points (147, 239) and (41, 232).
; PLAN: r0=147(x1), r1=239(y1), r2=41(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 239
LDI r2, 41
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
