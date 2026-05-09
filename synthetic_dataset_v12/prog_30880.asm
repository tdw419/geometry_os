; DESCRIPTION: Places a blue 32x23 rectangle at position (42, 176).
; PLAN: r0=42(x), r1=176(y), r2=32(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 176
LDI r2, 32
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
