; DESCRIPTION: Renders a magenta line between points (217, 6) and (140, 112).
; PLAN: r0=217(x1), r1=6(y1), r2=140(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 6
LDI r2, 140
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
