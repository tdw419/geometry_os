; DESCRIPTION: Renders a red line between points (317, 116) and (193, 84).
; PLAN: r0=317(x1), r1=116(y1), r2=193(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 116
LDI r2, 193
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
