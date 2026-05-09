; DESCRIPTION: Draws a blue rectangle at (68, 76) with width 82 and height 76.
; PLAN: r0=68(x), r1=76(y), r2=82(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 76
LDI r2, 82
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
