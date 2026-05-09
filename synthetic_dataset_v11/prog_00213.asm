; DESCRIPTION: Composite: . Then Places a purple 10x98 rectangle at position (69, 134). Then Places a magenta circle of radius 74 at center (182, 136).
; PLAN: r0=69(x), r1=134(y), r2=10(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=182(x), r1=136(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple 10x98 rectangle at position (69, 134).
; PLAN: r0=69(x), r1=134(y), r2=10(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 134
LDI r2, 10
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 74 at center (182, 136).
; PLAN: r0=182(x), r1=136(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 136
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
