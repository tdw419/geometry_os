; DESCRIPTION: Places a blue 81x88 rectangle at position (373, 68).
; PLAN: r0=373(x), r1=68(y), r2=81(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 68
LDI r2, 81
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
