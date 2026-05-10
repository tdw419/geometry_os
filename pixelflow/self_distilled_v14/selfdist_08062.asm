; DESCRIPTION: Renders a red line segment connecting (52, 115) to (30, 29).
; PLAN: r0=52(x1), r1=115(y1), r2=30(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 115
LDI r2, 30
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
