; DESCRIPTION: Renders a magenta line between points (71, 138) and (179, 123).
; PLAN: r0=71(x1), r1=138(y1), r2=179(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 138
LDI r2, 179
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
