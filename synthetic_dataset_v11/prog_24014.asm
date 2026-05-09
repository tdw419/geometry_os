; DESCRIPTION: Renders a red box of size 69x104 starting at (158, 69).
; PLAN: r0=158(x), r1=69(y), r2=69(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 69
LDI r2, 69
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
