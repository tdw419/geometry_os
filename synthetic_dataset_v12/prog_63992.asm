; DESCRIPTION: Places a magenta 17x106 rectangle at position (285, 145).
; PLAN: r0=285(x), r1=145(y), r2=17(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 145
LDI r2, 17
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
