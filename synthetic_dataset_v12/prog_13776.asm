; DESCRIPTION: Renders a orange box of size 65x38 starting at (261, 114).
; PLAN: r0=261(x), r1=114(y), r2=65(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 114
LDI r2, 65
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
