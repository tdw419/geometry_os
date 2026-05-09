; DESCRIPTION: Renders a red box of size 31x86 starting at (339, 78).
; PLAN: r0=339(x), r1=78(y), r2=31(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 78
LDI r2, 31
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
