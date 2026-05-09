; DESCRIPTION: Places a magenta 37x31 rectangle at position (11, 3).
; PLAN: r0=11(x), r1=3(y), r2=37(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 3
LDI r2, 37
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
