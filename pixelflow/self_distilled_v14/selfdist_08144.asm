; DESCRIPTION: Renders a red line segment connecting (78, 93) to (125, 180).
; PLAN: r0=78(x1), r1=93(y1), r2=125(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 93
LDI r2, 125
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
