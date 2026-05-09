; DESCRIPTION: Places a blue 53x104 rectangle at position (421, 78).
; PLAN: r0=421(x), r1=78(y), r2=53(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 78
LDI r2, 53
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
