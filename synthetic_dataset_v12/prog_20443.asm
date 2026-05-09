; DESCRIPTION: Draws a blue rectangle at (325, 122) with width 42 and height 111.
; PLAN: r0=325(x), r1=122(y), r2=42(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 122
LDI r2, 42
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
