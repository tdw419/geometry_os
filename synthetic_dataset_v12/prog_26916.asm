; DESCRIPTION: Renders a purple line between points (53, 172) and (88, 242).
; PLAN: r0=53(x1), r1=172(y1), r2=88(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 172
LDI r2, 88
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
