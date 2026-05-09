; DESCRIPTION: Renders a magenta line between points (58, 134) and (135, 85).
; PLAN: r0=58(x1), r1=134(y1), r2=135(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 134
LDI r2, 135
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
