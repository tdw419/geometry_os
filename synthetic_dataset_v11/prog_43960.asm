; DESCRIPTION: Renders a orange box of size 69x67 starting at (84, 8).
; PLAN: r0=84(x), r1=8(y), r2=69(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 8
LDI r2, 69
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
