; DESCRIPTION: Draws a magenta line from (53, 130) to (112, 232).
; PLAN: r0=53(x1), r1=130(y1), r2=112(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 130
LDI r2, 112
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
