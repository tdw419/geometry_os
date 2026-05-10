; DESCRIPTION: Renders a magenta line between points (183, 67) and (145, 169).
; PLAN: r0=183(x1), r1=67(y1), r2=145(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 67
LDI r2, 145
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
