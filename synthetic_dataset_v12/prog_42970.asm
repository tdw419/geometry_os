; DESCRIPTION: Renders a black box of size 28x118 starting at (64, 24).
; PLAN: r0=64(x), r1=24(y), r2=28(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 24
LDI r2, 28
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
