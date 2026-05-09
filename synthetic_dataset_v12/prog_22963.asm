; DESCRIPTION: Renders a red box of size 118x61 starting at (39, 72).
; PLAN: r0=39(x), r1=72(y), r2=118(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 72
LDI r2, 118
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
