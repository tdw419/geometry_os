; DESCRIPTION: Renders a purple line between points (135, 61) and (411, 8).
; PLAN: r0=135(x1), r1=61(y1), r2=411(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 61
LDI r2, 411
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
