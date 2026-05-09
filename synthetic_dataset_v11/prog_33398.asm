; DESCRIPTION: Draws a black rectangle at (137, 108) with width 104 and height 59.
; PLAN: r0=137(x), r1=108(y), r2=104(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 108
LDI r2, 104
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
