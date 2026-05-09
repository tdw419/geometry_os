; DESCRIPTION: Renders a red line between points (442, 226) and (342, 75).
; PLAN: r0=442(x1), r1=226(y1), r2=342(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 226
LDI r2, 342
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
