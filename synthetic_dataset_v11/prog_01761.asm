; DESCRIPTION: Renders a blue line between points (29, 190) and (64, 11).
; PLAN: r0=29(x1), r1=190(y1), r2=64(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 190
LDI r2, 64
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
