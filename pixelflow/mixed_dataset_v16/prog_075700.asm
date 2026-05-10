; DESCRIPTION: Places a black 104x115 rectangle at position (343, 4).
; PLAN: r0=343(x), r1=4(y), r2=104(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 4
LDI r2, 104
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
