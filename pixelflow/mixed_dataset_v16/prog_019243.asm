; DESCRIPTION: Draws a blue rectangle at (354, 126) with width 69 and height 114.
; PLAN: r0=354(x), r1=126(y), r2=69(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 126
LDI r2, 69
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
