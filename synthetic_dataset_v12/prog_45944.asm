; DESCRIPTION: Renders a red box of size 114x34 starting at (324, 92).
; PLAN: r0=324(x), r1=92(y), r2=114(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 92
LDI r2, 114
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
