; DESCRIPTION: Places a magenta 17x72 rectangle at position (194, 67).
; PLAN: r0=194(x), r1=67(y), r2=17(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 67
LDI r2, 17
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
