; DESCRIPTION: Draws a blue rectangle at (62, 63) with width 82 and height 11.
; PLAN: r0=62(x), r1=63(y), r2=82(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 63
LDI r2, 82
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
