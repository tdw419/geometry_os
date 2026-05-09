; DESCRIPTION: Places a black 45x85 rectangle at position (0, 64).
; PLAN: r0=0(x), r1=64(y), r2=45(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 64
LDI r2, 45
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
