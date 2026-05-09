; DESCRIPTION: Draws a blue rectangle at (259, 8) with width 49 and height 53.
; PLAN: r0=259(x), r1=8(y), r2=49(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 8
LDI r2, 49
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
