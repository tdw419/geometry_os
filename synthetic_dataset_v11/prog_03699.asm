; DESCRIPTION: Renders a black box of size 73x29 starting at (131, 74).
; PLAN: r0=131(x), r1=74(y), r2=73(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 74
LDI r2, 73
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
