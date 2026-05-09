; DESCRIPTION: Renders a red line between points (117, 245) and (6, 212).
; PLAN: r0=117(x1), r1=245(y1), r2=6(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 245
LDI r2, 6
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
