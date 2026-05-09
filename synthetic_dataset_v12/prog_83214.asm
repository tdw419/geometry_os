; DESCRIPTION: Places a blue 117x114 rectangle at position (351, 37).
; PLAN: r0=351(x), r1=37(y), r2=117(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 37
LDI r2, 117
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
