; DESCRIPTION: Renders a magenta line between points (289, 53) and (124, 189).
; PLAN: r0=289(x1), r1=53(y1), r2=124(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 53
LDI r2, 124
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
