; DESCRIPTION: Places a blue 45x14 rectangle at position (353, 43).
; PLAN: r0=353(x), r1=43(y), r2=45(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 43
LDI r2, 45
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
