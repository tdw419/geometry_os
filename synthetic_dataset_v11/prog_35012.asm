; DESCRIPTION: Places a blue 112x108 rectangle at position (104, 13).
; PLAN: r0=104(x), r1=13(y), r2=112(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 13
LDI r2, 112
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
