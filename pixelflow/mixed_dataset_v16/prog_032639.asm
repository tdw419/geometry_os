; DESCRIPTION: Renders a black box of size 77x111 starting at (1, 53).
; PLAN: r0=1(x), r1=53(y), r2=77(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 53
LDI r2, 77
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
