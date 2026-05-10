; DESCRIPTION: Places a blue 42x81 box at position (114, 50).
; PLAN: r0=114(x), r1=50(y), r2=42(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 50
LDI r2, 42
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
