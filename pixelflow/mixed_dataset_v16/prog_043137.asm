; DESCRIPTION: Renders a red line segment connecting (33, 95) to (114, 181).
; PLAN: r0=33(x1), r1=95(y1), r2=114(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 95
LDI r2, 114
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
