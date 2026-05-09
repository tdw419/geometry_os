; DESCRIPTION: Renders a red line between points (22, 98) and (86, 16).
; PLAN: r0=22(x1), r1=98(y1), r2=86(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 98
LDI r2, 86
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
