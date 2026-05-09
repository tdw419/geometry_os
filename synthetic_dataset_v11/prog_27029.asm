; DESCRIPTION: Renders a black box of size 58x22 starting at (12, 64).
; PLAN: r0=12(x), r1=64(y), r2=58(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 64
LDI r2, 58
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
