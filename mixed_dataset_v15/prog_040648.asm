; DESCRIPTION: Draws a black rectangle at (268, 142) with width 103 and height 37.
; PLAN: r0=268(x), r1=142(y), r2=103(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 142
LDI r2, 103
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
