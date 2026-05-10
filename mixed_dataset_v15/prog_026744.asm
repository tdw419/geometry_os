; DESCRIPTION: Renders a orange box of size 69x116 starting at (180, 97).
; PLAN: r0=180(x), r1=97(y), r2=69(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 97
LDI r2, 69
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
