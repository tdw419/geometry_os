; DESCRIPTION: Places a black 63x78 rectangle at position (377, 32).
; PLAN: r0=377(x), r1=32(y), r2=63(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 32
LDI r2, 63
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
