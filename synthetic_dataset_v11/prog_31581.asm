; DESCRIPTION: Renders a orange line between points (113, 14) and (10, 192).
; PLAN: r0=113(x1), r1=14(y1), r2=10(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 14
LDI r2, 10
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
