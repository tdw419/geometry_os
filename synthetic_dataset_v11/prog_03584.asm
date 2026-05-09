; DESCRIPTION: Places a blue 58x30 rectangle at position (124, 105).
; PLAN: r0=124(x), r1=105(y), r2=58(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 105
LDI r2, 58
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
