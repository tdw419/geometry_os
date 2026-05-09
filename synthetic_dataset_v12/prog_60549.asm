; DESCRIPTION: Draws a black rectangle at (447, 63) with width 55 and height 62.
; PLAN: r0=447(x), r1=63(y), r2=55(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 63
LDI r2, 55
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
