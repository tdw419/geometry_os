; DESCRIPTION: Renders a black line between points (39, 45) and (114, 84).
; PLAN: r0=39(x1), r1=45(y1), r2=114(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 45
LDI r2, 114
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
