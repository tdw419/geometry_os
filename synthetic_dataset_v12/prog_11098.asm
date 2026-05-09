; DESCRIPTION: Renders a red box of size 115x81 starting at (105, 158).
; PLAN: r0=105(x), r1=158(y), r2=115(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 158
LDI r2, 115
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
