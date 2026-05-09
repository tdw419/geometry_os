; DESCRIPTION: Places a blue 87x114 rectangle at position (74, 26).
; PLAN: r0=74(x), r1=26(y), r2=87(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 26
LDI r2, 87
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
