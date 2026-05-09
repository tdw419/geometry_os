; DESCRIPTION: Renders a red line between points (28, 30) and (24, 77).
; PLAN: r0=28(x1), r1=30(y1), r2=24(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 30
LDI r2, 24
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
