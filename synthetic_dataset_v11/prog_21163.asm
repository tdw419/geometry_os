; DESCRIPTION: Composite: . Then Renders a cyan box of size 103x90 starting at (16, 8). Then Draws a purple circle centered at (67, 183) with radius 37.
; PLAN: r0=16(x), r1=8(y), r2=103(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=67(x), r1=183(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 103x90 starting at (16, 8).
; PLAN: r0=16(x), r1=8(y), r2=103(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 8
LDI r2, 103
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (67, 183) with radius 37.
; PLAN: r0=67(x), r1=183(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 183
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
