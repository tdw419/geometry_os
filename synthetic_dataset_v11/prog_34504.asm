; DESCRIPTION: Places a blue 114x14 rectangle at position (49, 140).
; PLAN: r0=49(x), r1=140(y), r2=114(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 140
LDI r2, 114
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
