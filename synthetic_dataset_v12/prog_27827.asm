; DESCRIPTION: Places a blue 87x38 rectangle at position (354, 42).
; PLAN: r0=354(x), r1=42(y), r2=87(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 42
LDI r2, 87
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
