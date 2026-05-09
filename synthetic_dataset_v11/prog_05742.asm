; DESCRIPTION: Composite: . Then Places a black 67x98 rectangle at position (117, 117). Then Draws a purple circle centered at (64, 138) with radius 24.
; PLAN: r0=117(x), r1=117(y), r2=67(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=64(x), r1=138(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 67x98 rectangle at position (117, 117).
; PLAN: r0=117(x), r1=117(y), r2=67(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 117
LDI r2, 67
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (64, 138) with radius 24.
; PLAN: r0=64(x), r1=138(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 138
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
