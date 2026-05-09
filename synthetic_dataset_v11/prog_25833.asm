; DESCRIPTION: Places a blue 62x63 rectangle at position (156, 30).
; PLAN: r0=156(x), r1=30(y), r2=62(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 30
LDI r2, 62
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
