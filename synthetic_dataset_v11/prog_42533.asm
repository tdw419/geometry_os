; DESCRIPTION: Places a magenta 53x31 rectangle at position (201, 128).
; PLAN: r0=201(x), r1=128(y), r2=53(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 128
LDI r2, 53
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
