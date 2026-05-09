; DESCRIPTION: Renders a red box of size 74x69 starting at (0, 15).
; PLAN: r0=0(x), r1=15(y), r2=74(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 15
LDI r2, 74
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
