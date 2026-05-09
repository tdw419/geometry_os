; DESCRIPTION: Draws a black rectangle at (232, 146) with width 29 and height 71.
; PLAN: r0=232(x), r1=146(y), r2=29(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 146
LDI r2, 29
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
