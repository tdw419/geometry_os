; DESCRIPTION: Renders a red box of size 74x20 starting at (43, 93).
; PLAN: r0=43(x), r1=93(y), r2=74(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 93
LDI r2, 74
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
