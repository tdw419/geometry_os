; DESCRIPTION: Renders a orange line segment connecting (255, 51) to (306, 194).
; PLAN: r0=255(x1), r1=51(y1), r2=306(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 51
LDI r2, 306
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
