; DESCRIPTION: Renders a orange line between points (279, 43) and (468, 96).
; PLAN: r0=279(x1), r1=43(y1), r2=468(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 43
LDI r2, 468
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
