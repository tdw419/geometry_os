; DESCRIPTION: Renders a red line between points (81, 39) and (285, 131).
; PLAN: r0=81(x1), r1=39(y1), r2=285(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 39
LDI r2, 285
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
