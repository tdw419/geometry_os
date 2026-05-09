; DESCRIPTION: Renders a black box of size 32x96 starting at (141, 46).
; PLAN: r0=141(x), r1=46(y), r2=32(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 46
LDI r2, 32
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
