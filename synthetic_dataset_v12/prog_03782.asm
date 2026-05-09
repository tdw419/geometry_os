; DESCRIPTION: Renders a red line between points (209, 100) and (86, 66).
; PLAN: r0=209(x1), r1=100(y1), r2=86(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 100
LDI r2, 86
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
