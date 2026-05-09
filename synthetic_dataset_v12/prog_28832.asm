; DESCRIPTION: Renders a blue line between points (337, 179) and (279, 20).
; PLAN: r0=337(x1), r1=179(y1), r2=279(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 179
LDI r2, 279
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
