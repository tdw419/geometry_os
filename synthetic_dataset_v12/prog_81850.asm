; DESCRIPTION: Places a blue 37x78 rectangle at position (475, 72).
; PLAN: r0=475(x), r1=72(y), r2=37(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 72
LDI r2, 37
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
