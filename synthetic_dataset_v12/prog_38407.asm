; DESCRIPTION: Draws a blue rectangle at (125, 68) with width 53 and height 101.
; PLAN: r0=125(x), r1=68(y), r2=53(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 68
LDI r2, 53
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
