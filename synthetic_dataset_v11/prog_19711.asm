; DESCRIPTION: Places a blue 32x114 rectangle at position (195, 86).
; PLAN: r0=195(x), r1=86(y), r2=32(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 86
LDI r2, 32
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
