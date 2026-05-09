; DESCRIPTION: Draws a black rectangle at (447, 59) with width 43 and height 115.
; PLAN: r0=447(x), r1=59(y), r2=43(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 59
LDI r2, 43
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
