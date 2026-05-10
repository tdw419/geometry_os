; DESCRIPTION: Places a magenta 59x70 box at position (219, 62).
; PLAN: r0=219(x), r1=62(y), r2=59(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 62
LDI r2, 59
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
