; DESCRIPTION: Renders a blue line between points (60, 24) and (176, 190).
; PLAN: r0=60(x1), r1=24(y1), r2=176(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 24
LDI r2, 176
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
