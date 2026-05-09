; DESCRIPTION: Renders a red box of size 76x34 starting at (93, 206).
; PLAN: r0=93(x), r1=206(y), r2=76(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 206
LDI r2, 76
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
