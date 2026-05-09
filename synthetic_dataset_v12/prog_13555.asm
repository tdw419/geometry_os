; DESCRIPTION: Draws a black rectangle at (397, 16) with width 103 and height 113.
; PLAN: r0=397(x), r1=16(y), r2=103(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 16
LDI r2, 103
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
