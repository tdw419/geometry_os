; DESCRIPTION: Renders a black box of size 53x112 starting at (176, 29).
; PLAN: r0=176(x), r1=29(y), r2=53(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 29
LDI r2, 53
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
