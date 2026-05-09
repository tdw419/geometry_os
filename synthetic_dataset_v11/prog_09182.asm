; DESCRIPTION: Renders a red box of size 49x36 starting at (14, 101).
; PLAN: r0=14(x), r1=101(y), r2=49(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 101
LDI r2, 49
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
