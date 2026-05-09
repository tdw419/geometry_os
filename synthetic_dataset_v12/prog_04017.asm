; DESCRIPTION: Renders a magenta line between points (60, 46) and (250, 94).
; PLAN: r0=60(x1), r1=46(y1), r2=250(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 46
LDI r2, 250
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
