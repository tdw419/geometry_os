; DESCRIPTION: Renders a black box of size 61x29 starting at (151, 53).
; PLAN: r0=151(x), r1=53(y), r2=61(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 53
LDI r2, 61
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
