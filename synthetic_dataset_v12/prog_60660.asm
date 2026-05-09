; DESCRIPTION: Places a blue 114x93 rectangle at position (354, 99).
; PLAN: r0=354(x), r1=99(y), r2=114(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 99
LDI r2, 114
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
