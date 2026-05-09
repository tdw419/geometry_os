; DESCRIPTION: Renders a red line between points (72, 70) and (20, 156).
; PLAN: r0=72(x1), r1=70(y1), r2=20(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 70
LDI r2, 20
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
