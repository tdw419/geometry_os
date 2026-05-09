; DESCRIPTION: Renders a black box of size 32x71 starting at (388, 73).
; PLAN: r0=388(x), r1=73(y), r2=32(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 73
LDI r2, 32
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
