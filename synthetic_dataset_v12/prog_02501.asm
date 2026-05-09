; DESCRIPTION: Places a blue 45x69 rectangle at position (11, 24).
; PLAN: r0=11(x), r1=24(y), r2=45(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 24
LDI r2, 45
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
