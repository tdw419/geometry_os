; DESCRIPTION: Draws a black rectangle at (287, 53) with width 94 and height 60.
; PLAN: r0=287(x), r1=53(y), r2=94(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 53
LDI r2, 94
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
