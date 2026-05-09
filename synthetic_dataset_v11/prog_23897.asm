; DESCRIPTION: Draws a blue rectangle at (53, 58) with width 112 and height 101.
; PLAN: r0=53(x), r1=58(y), r2=112(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 58
LDI r2, 112
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
