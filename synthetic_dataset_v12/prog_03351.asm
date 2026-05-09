; DESCRIPTION: Renders a red box of size 90x35 starting at (2, 96).
; PLAN: r0=2(x), r1=96(y), r2=90(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 96
LDI r2, 90
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
