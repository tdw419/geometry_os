; DESCRIPTION: Places a magenta 75x13 rectangle at position (234, 22).
; PLAN: r0=234(x), r1=22(y), r2=75(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 22
LDI r2, 75
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
