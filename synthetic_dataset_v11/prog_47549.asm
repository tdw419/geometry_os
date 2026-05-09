; DESCRIPTION: Places a blue 66x93 rectangle at position (34, 128).
; PLAN: r0=34(x), r1=128(y), r2=66(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 128
LDI r2, 66
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
