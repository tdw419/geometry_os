; DESCRIPTION: Places a blue 94x108 rectangle at position (124, 30).
; PLAN: r0=124(x), r1=30(y), r2=94(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 30
LDI r2, 94
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
