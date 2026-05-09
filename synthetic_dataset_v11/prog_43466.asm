; DESCRIPTION: Renders a orange box of size 56x78 starting at (145, 151).
; PLAN: r0=145(x), r1=151(y), r2=56(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 151
LDI r2, 56
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
