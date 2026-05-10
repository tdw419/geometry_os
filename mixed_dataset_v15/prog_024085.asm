; DESCRIPTION: Renders a orange box of size 34x33 starting at (330, 78).
; PLAN: r0=330(x), r1=78(y), r2=34(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 78
LDI r2, 34
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
