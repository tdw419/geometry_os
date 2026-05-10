; DESCRIPTION: Renders a black box of size 19x32 starting at (289, 81).
; PLAN: r0=289(x), r1=81(y), r2=19(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 81
LDI r2, 19
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
