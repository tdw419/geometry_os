; DESCRIPTION: Renders a orange box of size 101x95 starting at (232, 62).
; PLAN: r0=232(x), r1=62(y), r2=101(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 62
LDI r2, 101
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
