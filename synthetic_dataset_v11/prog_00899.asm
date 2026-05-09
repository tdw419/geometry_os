; DESCRIPTION: Places a green 81x105 rectangle at position (84, 116).
; PLAN: r0=84(x), r1=116(y), r2=81(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 116
LDI r2, 81
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
