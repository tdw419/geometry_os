; DESCRIPTION: Renders a purple line between points (291, 177) and (456, 170).
; PLAN: r0=291(x1), r1=177(y1), r2=456(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 177
LDI r2, 456
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
