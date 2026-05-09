; DESCRIPTION: Renders a orange box of size 99x76 starting at (71, 123).
; PLAN: r0=71(x), r1=123(y), r2=99(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 123
LDI r2, 99
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
