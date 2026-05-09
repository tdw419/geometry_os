; DESCRIPTION: Draws a blue rectangle at (62, 98) with width 103 and height 20.
; PLAN: r0=62(x), r1=98(y), r2=103(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 98
LDI r2, 103
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
