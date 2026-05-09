; DESCRIPTION: Draws a black rectangle at (482, 180) with width 12 and height 53.
; PLAN: r0=482(x), r1=180(y), r2=12(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 180
LDI r2, 12
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
