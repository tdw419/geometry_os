; DESCRIPTION: Places a blue 72x106 rectangle at position (13, 67).
; PLAN: r0=13(x), r1=67(y), r2=72(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 67
LDI r2, 72
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
