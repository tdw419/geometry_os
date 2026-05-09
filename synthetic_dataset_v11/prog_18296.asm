; DESCRIPTION: Draws a blue rectangle at (122, 126) with width 111 and height 100.
; PLAN: r0=122(x), r1=126(y), r2=111(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 126
LDI r2, 111
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
