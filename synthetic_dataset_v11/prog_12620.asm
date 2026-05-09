; DESCRIPTION: Places a blue 16x56 rectangle at position (67, 15).
; PLAN: r0=67(x), r1=15(y), r2=16(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 15
LDI r2, 16
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
