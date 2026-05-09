; DESCRIPTION: Places a blue 53x36 rectangle at position (37, 46).
; PLAN: r0=37(x), r1=46(y), r2=53(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 46
LDI r2, 53
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
