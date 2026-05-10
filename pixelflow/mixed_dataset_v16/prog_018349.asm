; DESCRIPTION: Draws a black rectangle at (373, 19) with width 53 and height 40.
; PLAN: r0=373(x), r1=19(y), r2=53(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 19
LDI r2, 53
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
