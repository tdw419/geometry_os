; DESCRIPTION: Places a blue 75x60 rectangle at position (158, 64).
; PLAN: r0=158(x), r1=64(y), r2=75(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 64
LDI r2, 75
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
