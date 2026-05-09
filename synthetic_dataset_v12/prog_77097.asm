; DESCRIPTION: Renders a orange line between points (339, 48) and (454, 40).
; PLAN: r0=339(x1), r1=48(y1), r2=454(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 48
LDI r2, 454
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
