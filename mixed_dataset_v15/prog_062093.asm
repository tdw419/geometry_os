; DESCRIPTION: Places a black 64x12 rectangle at position (82, 140).
; PLAN: r0=82(x), r1=140(y), r2=64(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 140
LDI r2, 64
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
