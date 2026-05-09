; DESCRIPTION: Places a blue 114x37 rectangle at position (119, 160).
; PLAN: r0=119(x), r1=160(y), r2=114(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 160
LDI r2, 114
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
