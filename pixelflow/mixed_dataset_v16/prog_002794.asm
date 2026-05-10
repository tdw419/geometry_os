; DESCRIPTION: Places a orange 64x87 rectangle at position (256, 49).
; PLAN: r0=256(x), r1=49(y), r2=64(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 49
LDI r2, 64
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
