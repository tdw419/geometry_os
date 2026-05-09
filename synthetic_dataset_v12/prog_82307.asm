; DESCRIPTION: Renders a orange box of size 69x28 starting at (406, 163).
; PLAN: r0=406(x), r1=163(y), r2=69(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 163
LDI r2, 69
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
