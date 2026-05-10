; DESCRIPTION: Renders a orange box of size 26x46 starting at (477, 5).
; PLAN: r0=477(x), r1=5(y), r2=26(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 5
LDI r2, 26
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
