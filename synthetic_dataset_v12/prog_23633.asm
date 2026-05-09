; DESCRIPTION: Renders a magenta line between points (247, 87) and (35, 230).
; PLAN: r0=247(x1), r1=87(y1), r2=35(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 87
LDI r2, 35
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
