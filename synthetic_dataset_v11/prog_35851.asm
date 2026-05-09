; DESCRIPTION: Renders a red line between points (100, 173) and (233, 69).
; PLAN: r0=100(x1), r1=173(y1), r2=233(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 173
LDI r2, 233
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
