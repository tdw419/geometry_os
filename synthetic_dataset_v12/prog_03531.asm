; DESCRIPTION: Renders a orange box of size 78x39 starting at (3, 74).
; PLAN: r0=3(x), r1=74(y), r2=78(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 74
LDI r2, 78
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
