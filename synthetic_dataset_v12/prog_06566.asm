; DESCRIPTION: Renders a black box of size 39x69 starting at (103, 151).
; PLAN: r0=103(x), r1=151(y), r2=39(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 151
LDI r2, 39
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
