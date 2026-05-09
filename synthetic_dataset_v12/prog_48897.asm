; DESCRIPTION: Draws a black rectangle at (361, 34) with width 53 and height 103.
; PLAN: r0=361(x), r1=34(y), r2=53(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 34
LDI r2, 53
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
