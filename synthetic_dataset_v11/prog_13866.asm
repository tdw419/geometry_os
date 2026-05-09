; DESCRIPTION: Renders a orange box of size 33x38 starting at (76, 108).
; PLAN: r0=76(x), r1=108(y), r2=33(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 108
LDI r2, 33
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
