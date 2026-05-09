; DESCRIPTION: Places a magenta 117x69 rectangle at position (345, 145).
; PLAN: r0=345(x), r1=145(y), r2=117(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 145
LDI r2, 117
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
