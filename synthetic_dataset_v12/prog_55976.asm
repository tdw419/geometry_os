; DESCRIPTION: Renders a white box of size 53x35 starting at (67, 151).
; PLAN: r0=67(x), r1=151(y), r2=53(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 151
LDI r2, 53
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
