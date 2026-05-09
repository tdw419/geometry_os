; DESCRIPTION: Draws a blue rectangle at (34, 221) with width 114 and height 35.
; PLAN: r0=34(x), r1=221(y), r2=114(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 221
LDI r2, 114
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
