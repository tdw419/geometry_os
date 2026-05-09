; DESCRIPTION: Composite: . Then Places a magenta circle of radius 70 at center (153, 171). Then Renders a purple box of size 67x23 starting at (7, 63).
; PLAN: r0=153(x), r1=171(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=7(x), r1=63(y), r2=67(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 70 at center (153, 171).
; PLAN: r0=153(x), r1=171(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 171
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 67x23 starting at (7, 63).
; PLAN: r0=7(x), r1=63(y), r2=67(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 63
LDI r2, 67
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
