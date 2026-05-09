; DESCRIPTION: Renders a red box of size 87x96 starting at (38, 31).
; PLAN: r0=38(x), r1=31(y), r2=87(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 31
LDI r2, 87
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
