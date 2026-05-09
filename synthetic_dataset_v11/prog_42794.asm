; DESCRIPTION: Places a blue 81x75 rectangle at position (44, 176).
; PLAN: r0=44(x), r1=176(y), r2=81(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 176
LDI r2, 81
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
