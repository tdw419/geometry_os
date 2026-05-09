; DESCRIPTION: Places a black 104x54 rectangle at position (343, 11).
; PLAN: r0=343(x), r1=11(y), r2=104(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 11
LDI r2, 104
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
