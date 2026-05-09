; DESCRIPTION: Renders a orange box of size 15x43 starting at (129, 9).
; PLAN: r0=129(x), r1=9(y), r2=15(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 9
LDI r2, 15
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
