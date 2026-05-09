; DESCRIPTION: Draws a blue rectangle at (93, 111) with width 93 and height 76.
; PLAN: r0=93(x), r1=111(y), r2=93(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 111
LDI r2, 93
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
