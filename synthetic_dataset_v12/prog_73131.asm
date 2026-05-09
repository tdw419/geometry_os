; DESCRIPTION: Draws a purple rectangle at (354, 5) with width 30 and height 22.
; PLAN: r0=354(x), r1=5(y), r2=30(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 5
LDI r2, 30
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
