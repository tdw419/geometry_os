; DESCRIPTION: Composite: . Then Places a magenta circle of radius 69 at center (124, 153). Then Places a purple 23x12 rectangle at position (27, 66).
; PLAN: r0=124(x), r1=153(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=27(x), r1=66(y), r2=23(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 69 at center (124, 153).
; PLAN: r0=124(x), r1=153(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 153
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple 23x12 rectangle at position (27, 66).
; PLAN: r0=27(x), r1=66(y), r2=23(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 66
LDI r2, 23
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
