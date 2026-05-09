; DESCRIPTION: Renders a orange line between points (84, 114) and (178, 192).
; PLAN: r0=84(x1), r1=114(y1), r2=178(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 114
LDI r2, 178
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
