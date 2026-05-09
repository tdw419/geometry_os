; DESCRIPTION: Draws a blue rectangle at (30, 140) with width 113 and height 50.
; PLAN: r0=30(x), r1=140(y), r2=113(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 140
LDI r2, 113
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
