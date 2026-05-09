; DESCRIPTION: Renders a orange line between points (131, 56) and (158, 192).
; PLAN: r0=131(x1), r1=56(y1), r2=158(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 56
LDI r2, 158
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
