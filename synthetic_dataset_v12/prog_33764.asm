; DESCRIPTION: Renders a magenta line between points (216, 77) and (337, 242).
; PLAN: r0=216(x1), r1=77(y1), r2=337(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 77
LDI r2, 337
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
