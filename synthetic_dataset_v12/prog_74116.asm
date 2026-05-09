; DESCRIPTION: Renders a purple line between points (154, 174) and (49, 121).
; PLAN: r0=154(x1), r1=174(y1), r2=49(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 174
LDI r2, 49
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
