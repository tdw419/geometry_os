; DESCRIPTION: Draws a black rectangle at (159, 23) with width 67 and height 16.
; PLAN: r0=159(x), r1=23(y), r2=67(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 23
LDI r2, 67
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
