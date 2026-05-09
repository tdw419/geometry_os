; DESCRIPTION: Renders a black box of size 64x18 starting at (119, 74).
; PLAN: r0=119(x), r1=74(y), r2=64(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 74
LDI r2, 64
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
