; DESCRIPTION: Renders a red line between points (338, 30) and (66, 88).
; PLAN: r0=338(x1), r1=30(y1), r2=66(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 30
LDI r2, 66
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
