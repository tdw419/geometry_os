; DESCRIPTION: Places a blue 19x42 rectangle at position (163, 133).
; PLAN: r0=163(x), r1=133(y), r2=19(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 133
LDI r2, 19
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
