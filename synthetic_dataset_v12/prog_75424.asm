; DESCRIPTION: Renders a orange box of size 69x87 starting at (334, 11).
; PLAN: r0=334(x), r1=11(y), r2=69(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 11
LDI r2, 69
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
