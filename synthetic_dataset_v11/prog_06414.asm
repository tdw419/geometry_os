; DESCRIPTION: Renders a red box of size 31x28 starting at (60, 218).
; PLAN: r0=60(x), r1=218(y), r2=31(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 218
LDI r2, 31
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
