; DESCRIPTION: Renders a red line between points (79, 31) and (131, 226).
; PLAN: r0=79(x1), r1=31(y1), r2=131(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 31
LDI r2, 131
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
