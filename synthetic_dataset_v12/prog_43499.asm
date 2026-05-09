; DESCRIPTION: Renders a red box of size 62x20 starting at (49, 74).
; PLAN: r0=49(x), r1=74(y), r2=62(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 74
LDI r2, 62
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
