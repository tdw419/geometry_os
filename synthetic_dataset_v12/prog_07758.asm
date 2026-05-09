; DESCRIPTION: Renders a blue line between points (279, 71) and (226, 205).
; PLAN: r0=279(x1), r1=71(y1), r2=226(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 71
LDI r2, 226
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
