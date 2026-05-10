; DESCRIPTION: Places a blue 83x12 rectangle at position (107, 207).
; PLAN: r0=107(x), r1=207(y), r2=83(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 207
LDI r2, 83
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
