; DESCRIPTION: Renders a red box of size 11x14 starting at (73, 75).
; PLAN: r0=73(x), r1=75(y), r2=11(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 75
LDI r2, 11
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
