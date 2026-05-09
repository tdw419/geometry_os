; DESCRIPTION: Places a blue 36x114 rectangle at position (206, 23).
; PLAN: r0=206(x), r1=23(y), r2=36(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 23
LDI r2, 36
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
