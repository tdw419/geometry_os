; DESCRIPTION: Places a black 119x42 rectangle at position (351, 31).
; PLAN: r0=351(x), r1=31(y), r2=119(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 31
LDI r2, 119
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
