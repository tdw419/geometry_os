; DESCRIPTION: Renders a orange box of size 108x12 starting at (182, 199).
; PLAN: r0=182(x), r1=199(y), r2=108(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 199
LDI r2, 108
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
