; DESCRIPTION: Draws a blue rectangle at (379, 170) with width 67 and height 12.
; PLAN: r0=379(x), r1=170(y), r2=67(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 170
LDI r2, 67
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
