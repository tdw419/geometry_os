; DESCRIPTION: Places a blue 97x102 rectangle at position (117, 142).
; PLAN: r0=117(x), r1=142(y), r2=97(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 142
LDI r2, 97
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
