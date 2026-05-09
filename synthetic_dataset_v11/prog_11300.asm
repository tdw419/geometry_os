; DESCRIPTION: Renders a orange box of size 51x108 starting at (67, 67).
; PLAN: r0=67(x), r1=67(y), r2=51(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 67
LDI r2, 51
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
