; DESCRIPTION: Places a black 60x37 rectangle at position (63, 116).
; PLAN: r0=63(x), r1=116(y), r2=60(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 116
LDI r2, 60
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
