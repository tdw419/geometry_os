; DESCRIPTION: Renders a blue line between points (332, 125) and (301, 43).
; PLAN: r0=332(x1), r1=125(y1), r2=301(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 125
LDI r2, 301
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
