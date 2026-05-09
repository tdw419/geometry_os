; DESCRIPTION: Places a blue 43x74 rectangle at position (396, 88).
; PLAN: r0=396(x), r1=88(y), r2=43(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 88
LDI r2, 43
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
