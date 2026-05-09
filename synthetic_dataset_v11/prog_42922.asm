; DESCRIPTION: Renders a red box of size 97x23 starting at (96, 151).
; PLAN: r0=96(x), r1=151(y), r2=97(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 151
LDI r2, 97
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
