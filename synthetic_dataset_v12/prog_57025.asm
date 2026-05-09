; DESCRIPTION: Renders a red box of size 76x115 starting at (78, 136).
; PLAN: r0=78(x), r1=136(y), r2=76(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 136
LDI r2, 76
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
