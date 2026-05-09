; DESCRIPTION: Renders a purple line between points (113, 104) and (121, 190).
; PLAN: r0=113(x1), r1=104(y1), r2=121(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 104
LDI r2, 121
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
