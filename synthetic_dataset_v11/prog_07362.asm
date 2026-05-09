; DESCRIPTION: Renders a magenta line between points (205, 130) and (210, 245).
; PLAN: r0=205(x1), r1=130(y1), r2=210(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 130
LDI r2, 210
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
