; DESCRIPTION: Renders a orange box of size 119x27 starting at (76, 65).
; PLAN: r0=76(x), r1=65(y), r2=119(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 65
LDI r2, 119
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
