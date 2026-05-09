; DESCRIPTION: Draws a blue rectangle at (274, 82) with width 21 and height 69.
; PLAN: r0=274(x), r1=82(y), r2=21(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 82
LDI r2, 21
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
