; DESCRIPTION: Draws a black rectangle at (267, 2) with width 19 and height 32.
; PLAN: r0=267(x), r1=2(y), r2=19(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 2
LDI r2, 19
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
