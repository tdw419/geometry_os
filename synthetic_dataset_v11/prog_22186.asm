; DESCRIPTION: Composite: . Then Renders a black line between points (139, 53) and (197, 181). Then Places a red circle of radius 79 at center (138, 83).
; PLAN: r0=139(x1), r1=53(y1), r2=197(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=138(x), r1=83(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (139, 53) and (197, 181).
; PLAN: r0=139(x1), r1=53(y1), r2=197(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 53
LDI r2, 197
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 79 at center (138, 83).
; PLAN: r0=138(x), r1=83(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 83
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
