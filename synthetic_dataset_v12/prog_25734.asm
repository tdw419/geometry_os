; DESCRIPTION: Draws a magenta line from (49, 130) to (506, 204).
; PLAN: r0=49(x1), r1=130(y1), r2=506(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 130
LDI r2, 506
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
