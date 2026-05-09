; DESCRIPTION: Renders a magenta line between points (62, 102) and (71, 73).
; PLAN: r0=62(x1), r1=102(y1), r2=71(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 102
LDI r2, 71
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
