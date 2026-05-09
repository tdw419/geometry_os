; DESCRIPTION: Renders a red box of size 93x35 starting at (85, 81).
; PLAN: r0=85(x), r1=81(y), r2=93(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 81
LDI r2, 93
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
