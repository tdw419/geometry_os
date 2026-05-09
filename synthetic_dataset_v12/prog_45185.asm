; DESCRIPTION: Renders a red line between points (334, 180) and (16, 100).
; PLAN: r0=334(x1), r1=180(y1), r2=16(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 180
LDI r2, 16
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
