; DESCRIPTION: Draws a black rectangle at (329, 121) with width 68 and height 105.
; PLAN: r0=329(x), r1=121(y), r2=68(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 121
LDI r2, 68
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
