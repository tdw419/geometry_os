; DESCRIPTION: Renders a red line between points (174, 116) and (75, 22).
; PLAN: r0=174(x1), r1=116(y1), r2=75(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 116
LDI r2, 75
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
