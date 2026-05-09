; DESCRIPTION: Renders a black box of size 105x53 starting at (111, 142).
; PLAN: r0=111(x), r1=142(y), r2=105(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 142
LDI r2, 105
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
