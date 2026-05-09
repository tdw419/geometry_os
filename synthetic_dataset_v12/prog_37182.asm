; DESCRIPTION: Renders a red line between points (21, 99) and (179, 52).
; PLAN: r0=21(x1), r1=99(y1), r2=179(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 99
LDI r2, 179
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
