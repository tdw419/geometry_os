; DESCRIPTION: Draws a black rectangle at (32, 55) with width 103 and height 84.
; PLAN: r0=32(x), r1=55(y), r2=103(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 55
LDI r2, 103
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
