; DESCRIPTION: Draws a orange rectangle at (67, 13) with width 67 and height 32.
; PLAN: r0=67(x), r1=13(y), r2=67(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 13
LDI r2, 67
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
