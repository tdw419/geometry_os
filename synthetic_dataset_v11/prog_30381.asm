; DESCRIPTION: Draws a black rectangle at (233, 25) with width 12 and height 25.
; PLAN: r0=233(x), r1=25(y), r2=12(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 25
LDI r2, 12
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
