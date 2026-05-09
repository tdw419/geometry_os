; DESCRIPTION: Renders a black box of size 64x60 starting at (138, 101).
; PLAN: r0=138(x), r1=101(y), r2=64(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 101
LDI r2, 64
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
