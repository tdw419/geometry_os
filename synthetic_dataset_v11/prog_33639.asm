; DESCRIPTION: Renders a magenta line between points (2, 115) and (62, 57).
; PLAN: r0=2(x1), r1=115(y1), r2=62(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 115
LDI r2, 62
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
