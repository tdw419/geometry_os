; DESCRIPTION: Places a magenta 29x67 rectangle at position (16, 157).
; PLAN: r0=16(x), r1=157(y), r2=29(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 157
LDI r2, 29
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
