; DESCRIPTION: Renders a black line between points (310, 117) and (210, 53).
; PLAN: r0=310(x1), r1=117(y1), r2=210(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 117
LDI r2, 210
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
