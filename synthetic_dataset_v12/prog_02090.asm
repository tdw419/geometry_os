; DESCRIPTION: Renders a orange box of size 69x100 starting at (376, 149).
; PLAN: r0=376(x), r1=149(y), r2=69(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 149
LDI r2, 69
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
