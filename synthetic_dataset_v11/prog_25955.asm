; DESCRIPTION: Draws a black rectangle at (230, 27) with width 19 and height 104.
; PLAN: r0=230(x), r1=27(y), r2=19(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 27
LDI r2, 19
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
