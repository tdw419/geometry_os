; DESCRIPTION: Places a magenta 30x37 rectangle at position (472, 219).
; PLAN: r0=472(x), r1=219(y), r2=30(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 219
LDI r2, 30
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
