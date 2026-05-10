; DESCRIPTION: Renders a red box of size 14x99 starting at (59, 151).
; PLAN: r0=59(x), r1=151(y), r2=14(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 151
LDI r2, 14
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
