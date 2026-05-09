; DESCRIPTION: Places a magenta 17x88 rectangle at position (431, 142).
; PLAN: r0=431(x), r1=142(y), r2=17(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 142
LDI r2, 17
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
