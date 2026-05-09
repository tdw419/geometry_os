; DESCRIPTION: Composite: . Then Draws a black circle centered at (153, 83) with radius 64. Then Renders a white line between points (26, 176) and (53, 187).
; PLAN: r0=153(x), r1=83(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=26(x1), r1=176(y1), r2=53(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (153, 83) with radius 64.
; PLAN: r0=153(x), r1=83(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 83
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (26, 176) and (53, 187).
; PLAN: r0=26(x1), r1=176(y1), r2=53(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 176
LDI r2, 53
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
