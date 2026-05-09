; DESCRIPTION: Renders a orange line between points (192, 153) and (6, 182).
; PLAN: r0=192(x1), r1=153(y1), r2=6(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 153
LDI r2, 6
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
