; DESCRIPTION: Composite: . Then Places a purple 92x76 rectangle at position (134, 101). Then Draws a blue circle centered at (93, 117) with radius 60.
; PLAN: r0=134(x), r1=101(y), r2=92(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=93(x), r1=117(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple 92x76 rectangle at position (134, 101).
; PLAN: r0=134(x), r1=101(y), r2=92(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 101
LDI r2, 92
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (93, 117) with radius 60.
; PLAN: r0=93(x), r1=117(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 117
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
