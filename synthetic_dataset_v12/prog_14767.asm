; DESCRIPTION: Renders a orange box of size 39x23 starting at (416, 151).
; PLAN: r0=416(x), r1=151(y), r2=39(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 151
LDI r2, 39
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
