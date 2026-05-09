; DESCRIPTION: Renders a red box of size 107x38 starting at (292, 101).
; PLAN: r0=292(x), r1=101(y), r2=107(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 101
LDI r2, 107
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
