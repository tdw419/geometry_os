; DESCRIPTION: Draws a white rectangle at (354, 12) with width 39 and height 69.
; PLAN: r0=354(x), r1=12(y), r2=39(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 12
LDI r2, 39
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
