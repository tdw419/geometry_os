; DESCRIPTION: Places a black 85x42 rectangle at position (227, 104).
; PLAN: r0=227(x), r1=104(y), r2=85(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 104
LDI r2, 85
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
