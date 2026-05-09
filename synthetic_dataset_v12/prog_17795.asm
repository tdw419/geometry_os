; DESCRIPTION: Places a black 17x91 rectangle at position (155, 53).
; PLAN: r0=155(x), r1=53(y), r2=17(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 53
LDI r2, 17
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
