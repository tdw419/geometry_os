; DESCRIPTION: Renders a orange line between points (73, 13) and (158, 202).
; PLAN: r0=73(x1), r1=13(y1), r2=158(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 13
LDI r2, 158
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
