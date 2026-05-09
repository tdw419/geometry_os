; DESCRIPTION: Renders a red box of size 94x11 starting at (41, 96).
; PLAN: r0=41(x), r1=96(y), r2=94(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 96
LDI r2, 94
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
