; DESCRIPTION: Renders a red line between points (49, 50) and (156, 6).
; PLAN: r0=49(x1), r1=50(y1), r2=156(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 50
LDI r2, 156
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
