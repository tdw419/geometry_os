; DESCRIPTION: Renders a red box of size 62x89 starting at (259, 47).
; PLAN: r0=259(x), r1=47(y), r2=62(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 47
LDI r2, 62
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
