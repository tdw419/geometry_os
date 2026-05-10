; DESCRIPTION: Draws a blue rectangle at (35, 28) with width 50 and height 111.
; PLAN: r0=35(x), r1=28(y), r2=50(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 28
LDI r2, 50
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
