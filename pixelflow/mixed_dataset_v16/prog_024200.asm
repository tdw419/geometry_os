; DESCRIPTION: Places a blue 97x78 rectangle at position (148, 144).
; PLAN: r0=148(x), r1=144(y), r2=97(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 144
LDI r2, 97
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
