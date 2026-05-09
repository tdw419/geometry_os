; DESCRIPTION: Renders a red box of size 15x75 starting at (158, 18).
; PLAN: r0=158(x), r1=18(y), r2=15(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 18
LDI r2, 15
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
