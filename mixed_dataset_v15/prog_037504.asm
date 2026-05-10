; DESCRIPTION: Renders a red box of size 12x89 starting at (494, 39).
; PLAN: r0=494(x), r1=39(y), r2=12(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 39
LDI r2, 12
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
