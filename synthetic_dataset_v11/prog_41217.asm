; DESCRIPTION: Draws a black rectangle at (128, 103) with width 111 and height 15.
; PLAN: r0=128(x), r1=103(y), r2=111(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 103
LDI r2, 111
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
