; DESCRIPTION: Draws a blue rectangle at (412, 221) with width 83 and height 25.
; PLAN: r0=412(x), r1=221(y), r2=83(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 221
LDI r2, 83
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
