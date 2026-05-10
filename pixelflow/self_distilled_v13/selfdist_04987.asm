; DESCRIPTION: Renders a red line segment connecting (167, 146) to (84, 93).
; PLAN: r0=167(x1), r1=146(y1), r2=84(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 146
LDI r2, 84
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
