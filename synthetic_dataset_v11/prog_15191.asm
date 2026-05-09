; DESCRIPTION: Renders a red box of size 74x76 starting at (9, 64).
; PLAN: r0=9(x), r1=64(y), r2=74(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 64
LDI r2, 74
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
