; DESCRIPTION: Places a blue 60x98 rectangle at position (442, 99).
; PLAN: r0=442(x), r1=99(y), r2=60(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 99
LDI r2, 60
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
