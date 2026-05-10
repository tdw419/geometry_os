; DESCRIPTION: Places a blue 58x58 rectangle at position (436, 142).
; PLAN: r0=436(x), r1=142(y), r2=58(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 142
LDI r2, 58
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
