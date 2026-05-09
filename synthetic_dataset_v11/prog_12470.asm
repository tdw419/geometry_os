; DESCRIPTION: Places a blue 103x93 rectangle at position (32, 140).
; PLAN: r0=32(x), r1=140(y), r2=103(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 140
LDI r2, 103
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
