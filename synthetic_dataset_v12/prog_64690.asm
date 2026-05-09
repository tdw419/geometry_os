; DESCRIPTION: Draws a orange rectangle at (376, 139) with width 91 and height 67.
; PLAN: r0=376(x), r1=139(y), r2=91(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 139
LDI r2, 91
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
