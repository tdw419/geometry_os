; DESCRIPTION: Places a blue 82x42 box at position (119, 37).
; PLAN: r0=119(x), r1=37(y), r2=82(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 37
LDI r2, 82
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
