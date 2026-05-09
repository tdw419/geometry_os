; DESCRIPTION: Draws a black rectangle at (299, 166) with width 46 and height 58.
; PLAN: r0=299(x), r1=166(y), r2=46(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 166
LDI r2, 46
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
