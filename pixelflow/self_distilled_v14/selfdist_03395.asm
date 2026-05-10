; DESCRIPTION: Renders a red line segment connecting (366, 47) to (182, 158).
; PLAN: r0=366(x1), r1=47(y1), r2=182(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 47
LDI r2, 182
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
