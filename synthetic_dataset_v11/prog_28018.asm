; DESCRIPTION: Renders a white box of size 46x80 starting at (88, 151).
; PLAN: r0=88(x), r1=151(y), r2=46(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 151
LDI r2, 46
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
