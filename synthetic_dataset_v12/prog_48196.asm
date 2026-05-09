; DESCRIPTION: Renders a orange box of size 90x39 starting at (50, 203).
; PLAN: r0=50(x), r1=203(y), r2=90(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 203
LDI r2, 90
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
