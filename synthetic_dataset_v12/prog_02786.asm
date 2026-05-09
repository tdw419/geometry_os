; DESCRIPTION: Draws a yellow rectangle at (320, 67) with width 52 and height 84.
; PLAN: r0=320(x), r1=67(y), r2=52(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 67
LDI r2, 52
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
