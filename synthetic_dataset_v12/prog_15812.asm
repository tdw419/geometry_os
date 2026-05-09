; DESCRIPTION: Renders a purple line between points (18, 34) and (327, 112).
; PLAN: r0=18(x1), r1=34(y1), r2=327(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 34
LDI r2, 327
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
