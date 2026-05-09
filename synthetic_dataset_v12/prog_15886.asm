; DESCRIPTION: Renders a black box of size 53x57 starting at (153, 62).
; PLAN: r0=153(x), r1=62(y), r2=53(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 62
LDI r2, 53
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
