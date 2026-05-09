; DESCRIPTION: Draws a green rectangle at (412, 219) with width 67 and height 12.
; PLAN: r0=412(x), r1=219(y), r2=67(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 219
LDI r2, 67
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
