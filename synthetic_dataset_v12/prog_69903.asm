; DESCRIPTION: Renders a red box of size 52x12 starting at (339, 96).
; PLAN: r0=339(x), r1=96(y), r2=52(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 96
LDI r2, 52
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
