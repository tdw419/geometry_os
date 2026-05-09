; DESCRIPTION: Renders a yellow line between points (436, 156) and (429, 232).
; PLAN: r0=436(x1), r1=156(y1), r2=429(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 156
LDI r2, 429
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
