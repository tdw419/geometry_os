; DESCRIPTION: Places a blue 20x67 rectangle at position (232, 75).
; PLAN: r0=232(x), r1=75(y), r2=20(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 75
LDI r2, 20
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
