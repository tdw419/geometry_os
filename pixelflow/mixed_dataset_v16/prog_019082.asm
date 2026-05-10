; DESCRIPTION: Places a black 66x78 rectangle at position (72, 53).
; PLAN: r0=72(x), r1=53(y), r2=66(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 53
LDI r2, 66
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
