; DESCRIPTION: Renders a white line between points (93, 149) and (263, 85).
; PLAN: r0=93(x1), r1=149(y1), r2=263(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 149
LDI r2, 263
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
