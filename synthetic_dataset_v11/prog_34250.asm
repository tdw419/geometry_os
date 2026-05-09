; DESCRIPTION: Renders a magenta line between points (97, 247) and (145, 28).
; PLAN: r0=97(x1), r1=247(y1), r2=145(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 247
LDI r2, 145
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
