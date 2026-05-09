; DESCRIPTION: Renders a black box of size 53x68 starting at (136, 0).
; PLAN: r0=136(x), r1=0(y), r2=53(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 0
LDI r2, 53
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
