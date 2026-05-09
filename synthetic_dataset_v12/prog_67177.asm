; DESCRIPTION: Renders a orange box of size 49x67 starting at (47, 155).
; PLAN: r0=47(x), r1=155(y), r2=49(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 155
LDI r2, 49
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
