; DESCRIPTION: Places a black 104x15 rectangle at position (85, 159).
; PLAN: r0=85(x), r1=159(y), r2=104(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 159
LDI r2, 104
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
