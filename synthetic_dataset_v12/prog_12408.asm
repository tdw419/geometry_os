; DESCRIPTION: Places a blue 118x15 rectangle at position (99, 72).
; PLAN: r0=99(x), r1=72(y), r2=118(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 72
LDI r2, 118
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
