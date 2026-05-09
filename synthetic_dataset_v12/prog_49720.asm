; DESCRIPTION: Renders a magenta line between points (136, 87) and (182, 53).
; PLAN: r0=136(x1), r1=87(y1), r2=182(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 87
LDI r2, 182
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
