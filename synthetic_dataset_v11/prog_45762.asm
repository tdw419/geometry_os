; DESCRIPTION: Composite: . Then Places a red 82x47 rectangle at position (159, 67). Then Draws a black circle centered at (53, 166) with radius 27.
; PLAN: r0=159(x), r1=67(y), r2=82(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=53(x), r1=166(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red 82x47 rectangle at position (159, 67).
; PLAN: r0=159(x), r1=67(y), r2=82(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 67
LDI r2, 82
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (53, 166) with radius 27.
; PLAN: r0=53(x), r1=166(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 166
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
