; DESCRIPTION: Places a magenta 17x108 rectangle at position (201, 8).
; PLAN: r0=201(x), r1=8(y), r2=17(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 8
LDI r2, 17
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
