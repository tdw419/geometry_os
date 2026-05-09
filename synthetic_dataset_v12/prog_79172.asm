; DESCRIPTION: Renders a blue line between points (460, 47) and (456, 122).
; PLAN: r0=460(x1), r1=47(y1), r2=456(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 47
LDI r2, 456
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
