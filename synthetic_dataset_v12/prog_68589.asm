; DESCRIPTION: Renders a red line between points (461, 247) and (280, 5).
; PLAN: r0=461(x1), r1=247(y1), r2=280(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 247
LDI r2, 280
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
