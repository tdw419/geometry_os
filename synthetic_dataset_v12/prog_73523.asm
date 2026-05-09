; DESCRIPTION: Places a magenta 37x69 rectangle at position (359, 15).
; PLAN: r0=359(x), r1=15(y), r2=37(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 15
LDI r2, 37
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
