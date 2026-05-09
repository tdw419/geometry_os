; DESCRIPTION: Places a blue 20x23 rectangle at position (219, 69).
; PLAN: r0=219(x), r1=69(y), r2=20(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 69
LDI r2, 20
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
