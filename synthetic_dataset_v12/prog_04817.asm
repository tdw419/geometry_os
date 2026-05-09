; DESCRIPTION: Renders a magenta line between points (15, 33) and (477, 2).
; PLAN: r0=15(x1), r1=33(y1), r2=477(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 33
LDI r2, 477
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
