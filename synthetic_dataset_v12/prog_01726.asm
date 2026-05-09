; DESCRIPTION: Renders a blue line between points (73, 93) and (190, 0).
; PLAN: r0=73(x1), r1=93(y1), r2=190(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 93
LDI r2, 190
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
