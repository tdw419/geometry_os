; DESCRIPTION: Renders a red box of size 34x72 starting at (94, 43).
; PLAN: r0=94(x), r1=43(y), r2=34(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 43
LDI r2, 34
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
