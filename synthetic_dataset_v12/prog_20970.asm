; DESCRIPTION: Places a blue 88x93 rectangle at position (414, 121).
; PLAN: r0=414(x), r1=121(y), r2=88(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 121
LDI r2, 88
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
