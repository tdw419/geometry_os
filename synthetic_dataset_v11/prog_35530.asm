; DESCRIPTION: Renders a red box of size 71x73 starting at (7, 9).
; PLAN: r0=7(x), r1=9(y), r2=71(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 9
LDI r2, 71
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
