; DESCRIPTION: Renders a yellow box of size 107x29 starting at (53, 189).
; PLAN: r0=53(x), r1=189(y), r2=107(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 189
LDI r2, 107
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
