; DESCRIPTION: Renders a orange line between points (302, 0) and (64, 31).
; PLAN: r0=302(x1), r1=0(y1), r2=64(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 0
LDI r2, 64
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
