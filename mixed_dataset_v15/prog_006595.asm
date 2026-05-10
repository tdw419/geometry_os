; DESCRIPTION: Renders a orange box of size 76x113 starting at (234, 24).
; PLAN: r0=234(x), r1=24(y), r2=76(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 24
LDI r2, 76
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
