; DESCRIPTION: Renders a red line between points (291, 100) and (280, 130).
; PLAN: r0=291(x1), r1=100(y1), r2=280(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 100
LDI r2, 280
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
