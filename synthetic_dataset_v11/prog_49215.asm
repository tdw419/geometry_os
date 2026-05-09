; DESCRIPTION: Composite: . Then Draws a white rectangle at (170, 87) with width 71 and height 73. Then Places a black circle of radius 39 at center (137, 131).
; PLAN: r0=170(x), r1=87(y), r2=71(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=137(x), r1=131(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (170, 87) with width 71 and height 73.
; PLAN: r0=170(x), r1=87(y), r2=71(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 87
LDI r2, 71
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 39 at center (137, 131).
; PLAN: r0=137(x), r1=131(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 131
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
