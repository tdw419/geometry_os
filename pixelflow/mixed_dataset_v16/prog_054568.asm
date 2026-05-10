; DESCRIPTION: Places a blue 71x22 rectangle at position (325, 122).
; PLAN: r0=325(x), r1=122(y), r2=71(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 122
LDI r2, 71
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
