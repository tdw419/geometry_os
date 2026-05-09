; DESCRIPTION: Renders a black box of size 59x21 starting at (327, 53).
; PLAN: r0=327(x), r1=53(y), r2=59(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 53
LDI r2, 59
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
