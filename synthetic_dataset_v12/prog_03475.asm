; DESCRIPTION: Renders a orange box of size 45x53 starting at (49, 43).
; PLAN: r0=49(x), r1=43(y), r2=45(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 43
LDI r2, 45
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
