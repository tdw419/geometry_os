; DESCRIPTION: Draws a blue rectangle at (168, 30) with width 43 and height 83.
; PLAN: r0=168(x), r1=30(y), r2=43(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 30
LDI r2, 43
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
