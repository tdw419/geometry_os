; DESCRIPTION: Draws a blue rectangle at (49, 93) with width 13 and height 28.
; PLAN: r0=49(x), r1=93(y), r2=13(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 93
LDI r2, 13
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
