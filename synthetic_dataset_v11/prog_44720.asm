; DESCRIPTION: Places a blue 19x66 rectangle at position (99, 37).
; PLAN: r0=99(x), r1=37(y), r2=19(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 37
LDI r2, 19
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
