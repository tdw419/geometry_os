; DESCRIPTION: Renders a red box of size 26x81 starting at (39, 53).
; PLAN: r0=39(x), r1=53(y), r2=26(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 53
LDI r2, 26
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
