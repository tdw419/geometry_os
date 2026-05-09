; DESCRIPTION: Renders a black box of size 49x72 starting at (53, 80).
; PLAN: r0=53(x), r1=80(y), r2=49(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 80
LDI r2, 49
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
