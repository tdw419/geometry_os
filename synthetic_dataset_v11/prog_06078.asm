; DESCRIPTION: Renders a white line between points (99, 219) and (75, 2).
; PLAN: r0=99(x1), r1=219(y1), r2=75(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 219
LDI r2, 75
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
