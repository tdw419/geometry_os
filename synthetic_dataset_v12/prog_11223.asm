; DESCRIPTION: Renders a orange box of size 76x43 starting at (354, 162).
; PLAN: r0=354(x), r1=162(y), r2=76(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 162
LDI r2, 76
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
