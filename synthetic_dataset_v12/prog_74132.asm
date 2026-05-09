; DESCRIPTION: Places a blue 13x14 rectangle at position (350, 194).
; PLAN: r0=350(x), r1=194(y), r2=13(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 194
LDI r2, 13
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
