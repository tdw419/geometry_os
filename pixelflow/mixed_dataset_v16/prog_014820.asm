; DESCRIPTION: Renders a red box of size 69x84 starting at (344, 53).
; PLAN: r0=344(x), r1=53(y), r2=69(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 53
LDI r2, 69
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
