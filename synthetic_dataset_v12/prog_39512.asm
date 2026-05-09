; DESCRIPTION: Renders a blue line between points (146, 12) and (348, 245).
; PLAN: r0=146(x1), r1=12(y1), r2=348(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 12
LDI r2, 348
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
