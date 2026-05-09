; DESCRIPTION: Draws a black rectangle at (40, 121) with width 37 and height 33.
; PLAN: r0=40(x), r1=121(y), r2=37(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 121
LDI r2, 37
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
