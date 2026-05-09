; DESCRIPTION: Places a black 101x63 rectangle at position (257, 109).
; PLAN: r0=257(x), r1=109(y), r2=101(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 109
LDI r2, 101
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
