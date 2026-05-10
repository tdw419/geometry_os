; DESCRIPTION: Draws a magenta line from (147, 239) to (194, 194).
; PLAN: r0=147(x1), r1=239(y1), r2=194(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 239
LDI r2, 194
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
