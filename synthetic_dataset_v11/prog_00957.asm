; DESCRIPTION: Renders a magenta line between points (106, 241) and (241, 120).
; PLAN: r0=106(x1), r1=241(y1), r2=241(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 241
LDI r2, 241
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
