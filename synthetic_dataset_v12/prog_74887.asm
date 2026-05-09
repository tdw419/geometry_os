; DESCRIPTION: Renders a magenta line between points (467, 106) and (371, 121).
; PLAN: r0=467(x1), r1=106(y1), r2=371(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 106
LDI r2, 371
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
