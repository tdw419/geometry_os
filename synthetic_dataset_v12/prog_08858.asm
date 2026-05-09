; DESCRIPTION: Places a magenta 12x93 rectangle at position (220, 101).
; PLAN: r0=220(x), r1=101(y), r2=12(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 101
LDI r2, 12
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
