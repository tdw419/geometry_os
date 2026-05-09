; DESCRIPTION: Places a blue 83x14 rectangle at position (155, 114).
; PLAN: r0=155(x), r1=114(y), r2=83(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 114
LDI r2, 83
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
