; DESCRIPTION: Renders a red box of size 76x93 starting at (27, 33).
; PLAN: r0=27(x), r1=33(y), r2=76(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 33
LDI r2, 76
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
