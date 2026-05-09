; DESCRIPTION: Renders a blue line between points (117, 105) and (50, 43).
; PLAN: r0=117(x1), r1=105(y1), r2=50(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 105
LDI r2, 50
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
