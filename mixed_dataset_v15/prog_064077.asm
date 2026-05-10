; DESCRIPTION: Places a blue 100x114 rectangle at position (24, 128).
; PLAN: r0=24(x), r1=128(y), r2=100(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 128
LDI r2, 100
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
