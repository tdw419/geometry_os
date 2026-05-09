; DESCRIPTION: Places a purple 64x67 rectangle at position (144, 126).
; PLAN: r0=144(x), r1=126(y), r2=64(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 126
LDI r2, 64
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
