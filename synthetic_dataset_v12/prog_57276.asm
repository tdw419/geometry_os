; DESCRIPTION: Draws a blue rectangle at (37, 165) with width 82 and height 45.
; PLAN: r0=37(x), r1=165(y), r2=82(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 165
LDI r2, 82
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
