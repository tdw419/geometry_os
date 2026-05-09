; DESCRIPTION: Renders a red box of size 21x78 starting at (142, 30).
; PLAN: r0=142(x), r1=30(y), r2=21(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 30
LDI r2, 21
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
