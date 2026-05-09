; DESCRIPTION: Renders a red box of size 105x90 starting at (118, 96).
; PLAN: r0=118(x), r1=96(y), r2=105(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 96
LDI r2, 105
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
