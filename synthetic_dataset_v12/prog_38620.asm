; DESCRIPTION: Places a magenta 87x57 rectangle at position (11, 12).
; PLAN: r0=11(x), r1=12(y), r2=87(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 12
LDI r2, 87
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
