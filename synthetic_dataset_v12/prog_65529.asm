; DESCRIPTION: Places a blue 11x20 rectangle at position (472, 62).
; PLAN: r0=472(x), r1=62(y), r2=11(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 62
LDI r2, 11
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
