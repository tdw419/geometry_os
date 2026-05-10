; DESCRIPTION: Draws a yellow rectangle at (332, 126) with width 83 and height 104.
; PLAN: r0=332(x), r1=126(y), r2=83(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 126
LDI r2, 83
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
