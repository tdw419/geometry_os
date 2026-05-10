; DESCRIPTION: Renders a white box of size 76x14 starting at (314, 64).
; PLAN: r0=314(x), r1=64(y), r2=76(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 64
LDI r2, 76
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
