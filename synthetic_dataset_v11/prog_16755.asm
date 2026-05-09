; DESCRIPTION: Draws a black rectangle at (230, 55) with width 18 and height 16.
; PLAN: r0=230(x), r1=55(y), r2=18(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 55
LDI r2, 18
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
