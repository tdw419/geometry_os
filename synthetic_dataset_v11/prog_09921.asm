; DESCRIPTION: Renders a yellow line between points (190, 135) and (131, 197).
; PLAN: r0=190(x1), r1=135(y1), r2=131(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 135
LDI r2, 131
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
