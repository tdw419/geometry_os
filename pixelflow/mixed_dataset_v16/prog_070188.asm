; DESCRIPTION: Places a blue 86x88 rectangle at position (151, 110).
; PLAN: r0=151(x), r1=110(y), r2=86(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 110
LDI r2, 86
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
