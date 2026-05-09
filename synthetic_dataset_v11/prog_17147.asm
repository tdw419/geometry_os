; DESCRIPTION: Places a blue 81x71 rectangle at position (21, 97).
; PLAN: r0=21(x), r1=97(y), r2=81(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 97
LDI r2, 81
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
