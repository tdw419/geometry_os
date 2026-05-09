; DESCRIPTION: Renders a orange box of size 62x14 starting at (414, 3).
; PLAN: r0=414(x), r1=3(y), r2=62(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 3
LDI r2, 62
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
