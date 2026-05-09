; DESCRIPTION: Renders a white box of size 87x76 starting at (78, 3).
; PLAN: r0=78(x), r1=3(y), r2=87(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 3
LDI r2, 87
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
