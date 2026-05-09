; DESCRIPTION: Renders a red line between points (252, 64) and (30, 99).
; PLAN: r0=252(x1), r1=64(y1), r2=30(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 64
LDI r2, 30
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
