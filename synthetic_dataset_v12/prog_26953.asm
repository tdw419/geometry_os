; DESCRIPTION: Places a magenta 87x78 rectangle at position (56, 98).
; PLAN: r0=56(x), r1=98(y), r2=87(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 98
LDI r2, 87
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
