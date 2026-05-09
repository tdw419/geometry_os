; DESCRIPTION: Renders a red line between points (101, 106) and (68, 231).
; PLAN: r0=101(x1), r1=106(y1), r2=68(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 106
LDI r2, 68
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
