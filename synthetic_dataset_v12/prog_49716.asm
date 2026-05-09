; DESCRIPTION: Draws a black rectangle at (255, 192) with width 53 and height 35.
; PLAN: r0=255(x), r1=192(y), r2=53(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 192
LDI r2, 53
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
