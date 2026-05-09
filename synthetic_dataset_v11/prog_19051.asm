; DESCRIPTION: Renders a magenta line between points (161, 149) and (158, 31).
; PLAN: r0=161(x1), r1=149(y1), r2=158(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 149
LDI r2, 158
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
