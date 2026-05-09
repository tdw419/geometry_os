; DESCRIPTION: Renders a magenta line between points (193, 94) and (153, 76).
; PLAN: r0=193(x1), r1=94(y1), r2=153(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 94
LDI r2, 153
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
