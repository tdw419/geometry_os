; DESCRIPTION: Renders a orange box of size 49x62 starting at (273, 22).
; PLAN: r0=273(x), r1=22(y), r2=49(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 22
LDI r2, 49
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
