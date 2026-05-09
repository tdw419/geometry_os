; DESCRIPTION: Renders a orange box of size 19x72 starting at (232, 133).
; PLAN: r0=232(x), r1=133(y), r2=19(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 133
LDI r2, 19
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
