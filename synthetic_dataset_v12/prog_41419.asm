; DESCRIPTION: Renders a orange line between points (201, 101) and (242, 30).
; PLAN: r0=201(x1), r1=101(y1), r2=242(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 101
LDI r2, 242
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
