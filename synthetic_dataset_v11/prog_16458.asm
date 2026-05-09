; DESCRIPTION: Places a blue 58x114 rectangle at position (6, 20).
; PLAN: r0=6(x), r1=20(y), r2=58(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 20
LDI r2, 58
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
