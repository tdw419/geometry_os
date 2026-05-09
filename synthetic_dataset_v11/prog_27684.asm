; DESCRIPTION: Places a blue 13x67 rectangle at position (4, 4).
; PLAN: r0=4(x), r1=4(y), r2=13(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 4
LDI r2, 13
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
