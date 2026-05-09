; DESCRIPTION: Places a blue 53x14 rectangle at position (98, 58).
; PLAN: r0=98(x), r1=58(y), r2=53(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 58
LDI r2, 53
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
