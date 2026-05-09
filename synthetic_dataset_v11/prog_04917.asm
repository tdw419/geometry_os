; DESCRIPTION: Renders a magenta line between points (184, 115) and (240, 31).
; PLAN: r0=184(x1), r1=115(y1), r2=240(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 115
LDI r2, 240
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
