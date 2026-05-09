; DESCRIPTION: Places a blue 14x42 rectangle at position (85, 26).
; PLAN: r0=85(x), r1=26(y), r2=14(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 26
LDI r2, 14
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
