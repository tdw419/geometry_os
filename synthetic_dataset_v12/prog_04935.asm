; DESCRIPTION: Draws a black rectangle at (359, 21) with width 104 and height 111.
; PLAN: r0=359(x), r1=21(y), r2=104(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 21
LDI r2, 104
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
