; DESCRIPTION: Renders a orange box of size 26x72 starting at (420, 176).
; PLAN: r0=420(x), r1=176(y), r2=26(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 176
LDI r2, 26
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
