; DESCRIPTION: Renders a magenta line between points (0, 87) and (426, 145).
; PLAN: r0=0(x1), r1=87(y1), r2=426(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 87
LDI r2, 426
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
