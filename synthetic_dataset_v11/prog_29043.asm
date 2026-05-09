; DESCRIPTION: Renders a black box of size 49x45 starting at (53, 112).
; PLAN: r0=53(x), r1=112(y), r2=49(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 112
LDI r2, 49
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
