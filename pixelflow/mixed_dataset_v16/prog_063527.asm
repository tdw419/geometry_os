; DESCRIPTION: Draws a blue rectangle at (354, 109) with width 88 and height 82.
; PLAN: r0=354(x), r1=109(y), r2=88(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 109
LDI r2, 88
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
