; DESCRIPTION: Renders a red line between points (474, 7) and (75, 3).
; PLAN: r0=474(x1), r1=7(y1), r2=75(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 7
LDI r2, 75
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
