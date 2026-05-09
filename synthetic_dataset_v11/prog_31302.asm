; DESCRIPTION: Places a magenta 118x67 rectangle at position (128, 130).
; PLAN: r0=128(x), r1=130(y), r2=118(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 130
LDI r2, 118
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
