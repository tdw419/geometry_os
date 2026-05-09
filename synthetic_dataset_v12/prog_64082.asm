; DESCRIPTION: Places a magenta 69x94 rectangle at position (329, 145).
; PLAN: r0=329(x), r1=145(y), r2=69(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 145
LDI r2, 69
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
