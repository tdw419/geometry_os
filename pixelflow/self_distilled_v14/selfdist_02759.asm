; DESCRIPTION: Draws a yellow rectangle at (291, 83) with width 71 and height 104.
; PLAN: r0=291(x), r1=83(y), r2=71(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 83
LDI r2, 71
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
