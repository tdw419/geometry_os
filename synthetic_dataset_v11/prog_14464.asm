; DESCRIPTION: Renders a black box of size 13x12 starting at (20, 69).
; PLAN: r0=20(x), r1=69(y), r2=13(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 69
LDI r2, 13
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
