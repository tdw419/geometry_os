; DESCRIPTION: Renders a red line between points (212, 59) and (10, 5).
; PLAN: r0=212(x1), r1=59(y1), r2=10(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 59
LDI r2, 10
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
