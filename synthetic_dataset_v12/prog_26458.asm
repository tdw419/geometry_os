; DESCRIPTION: Places a blue 49x38 rectangle at position (255, 201).
; PLAN: r0=255(x), r1=201(y), r2=49(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 201
LDI r2, 49
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
