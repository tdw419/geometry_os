; DESCRIPTION: Draws a black rectangle at (209, 139) with width 38 and height 44.
; PLAN: r0=209(x), r1=139(y), r2=38(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 139
LDI r2, 38
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
