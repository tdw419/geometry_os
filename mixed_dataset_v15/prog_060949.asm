; DESCRIPTION: Renders a red line between points (176, 92) and (25, 68).
; PLAN: r0=176(x1), r1=92(y1), r2=25(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 92
LDI r2, 25
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
