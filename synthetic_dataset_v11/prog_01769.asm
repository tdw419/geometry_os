; DESCRIPTION: Renders a orange line between points (135, 51) and (247, 43).
; PLAN: r0=135(x1), r1=51(y1), r2=247(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 51
LDI r2, 247
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
