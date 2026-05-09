; DESCRIPTION: Renders a orange box of size 49x27 starting at (82, 203).
; PLAN: r0=82(x), r1=203(y), r2=49(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 203
LDI r2, 49
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
