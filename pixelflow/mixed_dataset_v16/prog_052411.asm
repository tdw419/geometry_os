; DESCRIPTION: Places a black 69x73 rectangle at position (441, 156).
; PLAN: r0=441(x), r1=156(y), r2=69(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 156
LDI r2, 69
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
