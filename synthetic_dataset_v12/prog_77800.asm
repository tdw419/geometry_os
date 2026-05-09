; DESCRIPTION: Draws a black rectangle at (72, 75) with width 32 and height 19.
; PLAN: r0=72(x), r1=75(y), r2=32(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 75
LDI r2, 32
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
