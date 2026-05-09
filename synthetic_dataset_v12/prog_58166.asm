; DESCRIPTION: Places a blue 109x101 rectangle at position (63, 93).
; PLAN: r0=63(x), r1=93(y), r2=109(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 93
LDI r2, 109
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
