; DESCRIPTION: Places a blue 64x31 rectangle at position (70, 56).
; PLAN: r0=70(x), r1=56(y), r2=64(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 56
LDI r2, 64
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
