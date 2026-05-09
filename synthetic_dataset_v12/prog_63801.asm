; DESCRIPTION: Places a magenta 62x118 rectangle at position (219, 14).
; PLAN: r0=219(x), r1=14(y), r2=62(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 14
LDI r2, 62
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
