; DESCRIPTION: Renders a red box of size 74x53 starting at (88, 50).
; PLAN: r0=88(x), r1=50(y), r2=74(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 50
LDI r2, 74
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
