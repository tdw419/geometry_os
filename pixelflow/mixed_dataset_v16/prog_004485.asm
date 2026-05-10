; DESCRIPTION: Places a magenta 94x78 rectangle at position (45, 74).
; PLAN: r0=45(x), r1=74(y), r2=94(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 74
LDI r2, 94
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
