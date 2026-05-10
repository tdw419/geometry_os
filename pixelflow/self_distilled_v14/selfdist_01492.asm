; DESCRIPTION: Places a magenta 88x69 box at position (337, 81).
; PLAN: r0=337(x), r1=81(y), r2=88(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 81
LDI r2, 88
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
