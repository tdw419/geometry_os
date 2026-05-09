; DESCRIPTION: Renders a black box of size 100x53 starting at (35, 160).
; PLAN: r0=35(x), r1=160(y), r2=100(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 160
LDI r2, 100
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
