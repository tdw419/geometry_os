; DESCRIPTION: Renders a orange line between points (382, 1) and (140, 59).
; PLAN: r0=382(x1), r1=1(y1), r2=140(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 1
LDI r2, 140
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
