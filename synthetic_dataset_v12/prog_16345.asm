; DESCRIPTION: Renders a black line between points (39, 35) and (200, 225).
; PLAN: r0=39(x1), r1=35(y1), r2=200(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 35
LDI r2, 200
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
