; DESCRIPTION: Renders a magenta line between points (108, 120) and (172, 140).
; PLAN: r0=108(x1), r1=120(y1), r2=172(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 120
LDI r2, 172
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
