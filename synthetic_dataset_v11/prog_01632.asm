; DESCRIPTION: Places a magenta 15x29 rectangle at position (191, 67).
; PLAN: r0=191(x), r1=67(y), r2=15(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 67
LDI r2, 15
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
