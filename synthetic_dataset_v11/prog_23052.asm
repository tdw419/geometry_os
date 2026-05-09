; DESCRIPTION: Places a blue 17x108 rectangle at position (63, 11).
; PLAN: r0=63(x), r1=11(y), r2=17(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 11
LDI r2, 17
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
