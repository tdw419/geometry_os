; DESCRIPTION: Renders a blue line between points (310, 141) and (492, 121).
; PLAN: r0=310(x1), r1=141(y1), r2=492(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 141
LDI r2, 492
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
