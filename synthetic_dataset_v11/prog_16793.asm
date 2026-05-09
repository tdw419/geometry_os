; DESCRIPTION: Places a blue 72x67 rectangle at position (6, 189).
; PLAN: r0=6(x), r1=189(y), r2=72(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 189
LDI r2, 72
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
