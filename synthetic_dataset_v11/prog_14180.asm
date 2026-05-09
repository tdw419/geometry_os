; DESCRIPTION: Renders a orange line between points (54, 209) and (112, 72).
; PLAN: r0=54(x1), r1=209(y1), r2=112(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 209
LDI r2, 112
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
