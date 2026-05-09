; DESCRIPTION: Renders a orange box of size 69x49 starting at (218, 188).
; PLAN: r0=218(x), r1=188(y), r2=69(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 188
LDI r2, 69
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
