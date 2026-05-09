; DESCRIPTION: Composite: . Then Places a black circle of radius 55 at center (190, 99). Then Draws a black rectangle at (66, 58) with width 82 and height 104.
; PLAN: r0=190(x), r1=99(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x), r1=58(y), r2=82(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 55 at center (190, 99).
; PLAN: r0=190(x), r1=99(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 99
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black rectangle at (66, 58) with width 82 and height 104.
; PLAN: r0=66(x), r1=58(y), r2=82(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 58
LDI r2, 82
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
