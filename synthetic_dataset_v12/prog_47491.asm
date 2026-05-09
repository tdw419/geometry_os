; DESCRIPTION: Places a blue 87x42 rectangle at position (227, 105).
; PLAN: r0=227(x), r1=105(y), r2=87(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 105
LDI r2, 87
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
