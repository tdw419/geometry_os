; DESCRIPTION: Renders a orange box of size 108x94 starting at (76, 56).
; PLAN: r0=76(x), r1=56(y), r2=108(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 56
LDI r2, 108
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
