; DESCRIPTION: Draws a black rectangle at (74, 165) with width 109 and height 21.
; PLAN: r0=74(x), r1=165(y), r2=109(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 165
LDI r2, 109
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
