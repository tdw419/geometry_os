; DESCRIPTION: Renders a red box of size 66x92 starting at (227, 12).
; PLAN: r0=227(x), r1=12(y), r2=66(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 12
LDI r2, 66
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
