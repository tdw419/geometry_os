; DESCRIPTION: Renders a black box of size 53x65 starting at (31, 131).
; PLAN: r0=31(x), r1=131(y), r2=53(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 131
LDI r2, 53
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
