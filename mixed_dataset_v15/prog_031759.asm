; DESCRIPTION: Renders a blue line between points (93, 154) and (74, 46).
; PLAN: r0=93(x1), r1=154(y1), r2=74(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 154
LDI r2, 74
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
