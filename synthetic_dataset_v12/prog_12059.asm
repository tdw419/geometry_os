; DESCRIPTION: Renders a red box of size 88x99 starting at (1, 71).
; PLAN: r0=1(x), r1=71(y), r2=88(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 71
LDI r2, 88
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
