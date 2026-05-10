; DESCRIPTION: Renders a red line segment connecting (193, 173) to (100, 158).
; PLAN: r0=193(x1), r1=173(y1), r2=100(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 173
LDI r2, 100
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
