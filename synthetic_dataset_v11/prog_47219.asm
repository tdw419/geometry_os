; DESCRIPTION: Composite: . Then Places a red circle of radius 23 at center (53, 202). Then Renders a black line between points (55, 196) and (223, 87).
; PLAN: r0=53(x), r1=202(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=55(x1), r1=196(y1), r2=223(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 23 at center (53, 202).
; PLAN: r0=53(x), r1=202(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 202
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (55, 196) and (223, 87).
; PLAN: r0=55(x1), r1=196(y1), r2=223(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 196
LDI r2, 223
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
