; DESCRIPTION: Places a blue 81x31 rectangle at position (15, 200).
; PLAN: r0=15(x), r1=200(y), r2=81(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 200
LDI r2, 81
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
