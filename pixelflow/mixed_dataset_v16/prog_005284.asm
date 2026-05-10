; DESCRIPTION: Renders a yellow rectangular region spanning 64 by 46 at (232, 53).
; PLAN: r0=232(x), r1=53(y), r2=64(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 53
LDI r2, 64
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
