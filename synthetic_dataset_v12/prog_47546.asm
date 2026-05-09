; DESCRIPTION: Renders a magenta line between points (14, 135) and (310, 232).
; PLAN: r0=14(x1), r1=135(y1), r2=310(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 135
LDI r2, 310
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
