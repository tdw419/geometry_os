; DESCRIPTION: Places a blue 49x49 rectangle at position (219, 9).
; PLAN: r0=219(x), r1=9(y), r2=49(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 9
LDI r2, 49
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
