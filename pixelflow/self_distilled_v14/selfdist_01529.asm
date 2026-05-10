; DESCRIPTION: Places a blue 53x42 box at position (31, 72).
; PLAN: r0=31(x), r1=72(y), r2=53(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 72
LDI r2, 53
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
