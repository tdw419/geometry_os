; DESCRIPTION: Draws a black rectangle at (393, 141) with width 13 and height 78.
; PLAN: r0=393(x), r1=141(y), r2=13(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 141
LDI r2, 13
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
