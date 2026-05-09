; DESCRIPTION: Places a blue 118x67 rectangle at position (98, 28).
; PLAN: r0=98(x), r1=28(y), r2=118(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 28
LDI r2, 118
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
