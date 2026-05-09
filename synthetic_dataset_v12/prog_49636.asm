; DESCRIPTION: Renders a orange box of size 91x15 starting at (327, 203).
; PLAN: r0=327(x), r1=203(y), r2=91(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 203
LDI r2, 91
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
