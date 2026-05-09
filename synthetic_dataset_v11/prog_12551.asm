; DESCRIPTION: Renders a black box of size 74x18 starting at (109, 224).
; PLAN: r0=109(x), r1=224(y), r2=74(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 224
LDI r2, 74
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
