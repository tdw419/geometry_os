; DESCRIPTION: Renders a black box of size 36x43 starting at (251, 53).
; PLAN: r0=251(x), r1=53(y), r2=36(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 53
LDI r2, 36
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
