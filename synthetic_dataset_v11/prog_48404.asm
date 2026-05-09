; DESCRIPTION: Renders a red box of size 116x99 starting at (23, 71).
; PLAN: r0=23(x), r1=71(y), r2=116(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 71
LDI r2, 116
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
