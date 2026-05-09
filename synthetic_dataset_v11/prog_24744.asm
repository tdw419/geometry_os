; DESCRIPTION: Renders a purple line between points (113, 19) and (74, 161).
; PLAN: r0=113(x1), r1=19(y1), r2=74(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 19
LDI r2, 74
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
