; DESCRIPTION: Renders a orange box of size 76x24 starting at (339, 141).
; PLAN: r0=339(x), r1=141(y), r2=76(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 141
LDI r2, 76
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
