; DESCRIPTION: Renders a red line between points (162, 92) and (58, 86).
; PLAN: r0=162(x1), r1=92(y1), r2=58(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 92
LDI r2, 58
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
