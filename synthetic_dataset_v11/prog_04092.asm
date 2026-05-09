; DESCRIPTION: Places a black 100x72 rectangle at position (104, 78).
; PLAN: r0=104(x), r1=78(y), r2=100(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 78
LDI r2, 100
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
