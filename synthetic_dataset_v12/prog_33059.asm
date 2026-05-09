; DESCRIPTION: Renders a red box of size 62x93 starting at (175, 106).
; PLAN: r0=175(x), r1=106(y), r2=62(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 106
LDI r2, 62
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
