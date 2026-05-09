; DESCRIPTION: Renders a red line between points (49, 135) and (40, 179).
; PLAN: r0=49(x1), r1=135(y1), r2=40(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 135
LDI r2, 40
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
