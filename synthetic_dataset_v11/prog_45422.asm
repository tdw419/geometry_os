; DESCRIPTION: Draws a blue rectangle at (53, 121) with width 43 and height 82.
; PLAN: r0=53(x), r1=121(y), r2=43(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 121
LDI r2, 43
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
