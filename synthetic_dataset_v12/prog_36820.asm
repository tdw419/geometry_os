; DESCRIPTION: Places a blue 21x84 rectangle at position (353, 45).
; PLAN: r0=353(x), r1=45(y), r2=21(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 45
LDI r2, 21
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
