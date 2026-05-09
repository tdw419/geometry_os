; DESCRIPTION: Renders a magenta line between points (109, 61) and (74, 45).
; PLAN: r0=109(x1), r1=61(y1), r2=74(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 61
LDI r2, 74
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
