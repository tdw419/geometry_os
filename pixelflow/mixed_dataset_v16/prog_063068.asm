; DESCRIPTION: Renders a red line segment connecting (78, 162) to (187, 173).
; PLAN: r0=78(x1), r1=162(y1), r2=187(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 162
LDI r2, 187
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
