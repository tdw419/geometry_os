; DESCRIPTION: Places a green 101x81 rectangle at position (84, 11).
; PLAN: r0=84(x), r1=11(y), r2=101(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 11
LDI r2, 101
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
