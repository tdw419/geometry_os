; DESCRIPTION: Renders a orange box of size 86x52 starting at (227, 101).
; PLAN: r0=227(x), r1=101(y), r2=86(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 101
LDI r2, 86
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
