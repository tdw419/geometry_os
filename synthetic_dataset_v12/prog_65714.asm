; DESCRIPTION: Renders a purple line between points (233, 117) and (16, 72).
; PLAN: r0=233(x1), r1=117(y1), r2=16(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 117
LDI r2, 16
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
