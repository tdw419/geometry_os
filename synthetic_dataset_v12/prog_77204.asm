; DESCRIPTION: Places a blue 86x110 rectangle at position (53, 82).
; PLAN: r0=53(x), r1=82(y), r2=86(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 82
LDI r2, 86
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
