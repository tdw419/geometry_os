; DESCRIPTION: Places a magenta 114x100 rectangle at position (359, 61).
; PLAN: r0=359(x), r1=61(y), r2=114(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 61
LDI r2, 114
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
