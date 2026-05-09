; DESCRIPTION: Places a green 101x58 rectangle at position (64, 67).
; PLAN: r0=64(x), r1=67(y), r2=101(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 67
LDI r2, 101
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
