; DESCRIPTION: Places a blue 94x37 rectangle at position (126, 60).
; PLAN: r0=126(x), r1=60(y), r2=94(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 60
LDI r2, 94
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
