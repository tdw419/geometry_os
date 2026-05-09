; DESCRIPTION: Renders a red box of size 48x76 starting at (122, 151).
; PLAN: r0=122(x), r1=151(y), r2=48(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 151
LDI r2, 48
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
