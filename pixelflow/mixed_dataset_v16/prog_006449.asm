; DESCRIPTION: Places a blue 49x37 rectangle at position (124, 117).
; PLAN: r0=124(x), r1=117(y), r2=49(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 117
LDI r2, 49
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
