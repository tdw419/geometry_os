; DESCRIPTION: Places a blue 81x114 rectangle at position (333, 65).
; PLAN: r0=333(x), r1=65(y), r2=81(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 65
LDI r2, 81
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
