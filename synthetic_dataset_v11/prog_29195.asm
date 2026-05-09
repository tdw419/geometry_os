; DESCRIPTION: Places a purple 87x60 rectangle at position (64, 16).
; PLAN: r0=64(x), r1=16(y), r2=87(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 16
LDI r2, 87
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
