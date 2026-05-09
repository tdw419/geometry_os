; DESCRIPTION: Places a blue 60x107 rectangle at position (45, 24).
; PLAN: r0=45(x), r1=24(y), r2=60(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 24
LDI r2, 60
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
