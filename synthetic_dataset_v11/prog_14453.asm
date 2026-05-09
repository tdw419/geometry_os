; DESCRIPTION: Renders a black box of size 85x20 starting at (76, 205).
; PLAN: r0=76(x), r1=205(y), r2=85(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 205
LDI r2, 85
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
