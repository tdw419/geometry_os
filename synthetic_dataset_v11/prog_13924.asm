; DESCRIPTION: Renders a black box of size 80x62 starting at (124, 53).
; PLAN: r0=124(x), r1=53(y), r2=80(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 53
LDI r2, 80
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
