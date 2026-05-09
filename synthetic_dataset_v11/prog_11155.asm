; DESCRIPTION: Places a blue 81x70 rectangle at position (60, 93).
; PLAN: r0=60(x), r1=93(y), r2=81(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 93
LDI r2, 81
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
