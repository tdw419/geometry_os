; DESCRIPTION: Renders a magenta line between points (161, 134) and (40, 212).
; PLAN: r0=161(x1), r1=134(y1), r2=40(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 134
LDI r2, 40
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
