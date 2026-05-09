; DESCRIPTION: Places a magenta 20x69 rectangle at position (86, 13).
; PLAN: r0=86(x), r1=13(y), r2=20(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 13
LDI r2, 20
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
