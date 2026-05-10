; DESCRIPTION: Renders a magenta line between points (212, 140) and (9, 60).
; PLAN: r0=212(x1), r1=140(y1), r2=9(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 140
LDI r2, 9
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
