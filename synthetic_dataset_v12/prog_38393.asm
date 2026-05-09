; DESCRIPTION: Renders a black line between points (182, 43) and (53, 39).
; PLAN: r0=182(x1), r1=43(y1), r2=53(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 43
LDI r2, 53
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
