; DESCRIPTION: Places a blue 86x117 rectangle at position (141, 93).
; PLAN: r0=141(x), r1=93(y), r2=86(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 93
LDI r2, 86
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
