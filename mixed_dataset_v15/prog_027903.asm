; DESCRIPTION: Places a blue 49x15 rectangle at position (396, 209).
; PLAN: r0=396(x), r1=209(y), r2=49(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 209
LDI r2, 49
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
