; DESCRIPTION: Renders a purple line between points (456, 3) and (287, 16).
; PLAN: r0=456(x1), r1=3(y1), r2=287(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 3
LDI r2, 287
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
