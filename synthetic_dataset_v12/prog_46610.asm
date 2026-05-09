; DESCRIPTION: Renders a red box of size 73x20 starting at (231, 49).
; PLAN: r0=231(x), r1=49(y), r2=73(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 49
LDI r2, 73
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
