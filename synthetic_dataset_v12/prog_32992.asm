; DESCRIPTION: Renders a red box of size 93x39 starting at (76, 96).
; PLAN: r0=76(x), r1=96(y), r2=93(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 96
LDI r2, 93
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
