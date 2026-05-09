; DESCRIPTION: Renders a blue line between points (19, 43) and (327, 5).
; PLAN: r0=19(x1), r1=43(y1), r2=327(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 43
LDI r2, 327
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
