; DESCRIPTION: Renders a red line between points (0, 212) and (285, 166).
; PLAN: r0=0(x1), r1=212(y1), r2=285(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 212
LDI r2, 285
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
