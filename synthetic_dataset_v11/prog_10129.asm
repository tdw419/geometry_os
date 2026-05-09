; DESCRIPTION: Places a blue 73x15 rectangle at position (67, 116).
; PLAN: r0=67(x), r1=116(y), r2=73(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 116
LDI r2, 73
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
