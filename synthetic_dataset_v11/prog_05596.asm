; DESCRIPTION: Renders a black box of size 46x63 starting at (13, 53).
; PLAN: r0=13(x), r1=53(y), r2=46(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 53
LDI r2, 46
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
