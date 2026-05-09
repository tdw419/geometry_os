; DESCRIPTION: Renders a magenta line between points (83, 176) and (165, 194).
; PLAN: r0=83(x1), r1=176(y1), r2=165(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 176
LDI r2, 165
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
