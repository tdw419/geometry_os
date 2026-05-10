; DESCRIPTION: Renders a black box of size 110x64 starting at (375, 114).
; PLAN: r0=375(x), r1=114(y), r2=110(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 114
LDI r2, 110
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
