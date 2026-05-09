; DESCRIPTION: Renders a blue line between points (399, 23) and (380, 52).
; PLAN: r0=399(x1), r1=23(y1), r2=380(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 23
LDI r2, 380
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
