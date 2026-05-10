; DESCRIPTION: Places a blue 21x70 rectangle at position (351, 22).
; PLAN: r0=351(x), r1=22(y), r2=21(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 22
LDI r2, 21
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
