; DESCRIPTION: Places a magenta 108x31 rectangle at position (83, 30).
; PLAN: r0=83(x), r1=30(y), r2=108(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 30
LDI r2, 108
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
