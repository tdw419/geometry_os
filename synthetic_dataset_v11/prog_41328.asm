; DESCRIPTION: Renders a white line between points (30, 100) and (81, 36).
; PLAN: r0=30(x1), r1=100(y1), r2=81(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 100
LDI r2, 81
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
