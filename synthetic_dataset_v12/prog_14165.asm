; DESCRIPTION: Places a orange line segment connecting (202, 71) to (274, 18).
; PLAN: r0=202(x1), r1=71(y1), r2=274(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 71
LDI r2, 274
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
