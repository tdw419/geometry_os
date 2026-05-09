; DESCRIPTION: Renders a black box of size 49x68 starting at (238, 179).
; PLAN: r0=238(x), r1=179(y), r2=49(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 179
LDI r2, 49
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
