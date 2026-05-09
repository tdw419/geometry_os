; DESCRIPTION: Renders a black box of size 30x53 starting at (62, 53).
; PLAN: r0=62(x), r1=53(y), r2=30(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 53
LDI r2, 30
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
