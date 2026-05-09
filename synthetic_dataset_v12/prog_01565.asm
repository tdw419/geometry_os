; DESCRIPTION: Places a magenta 37x55 rectangle at position (376, 191).
; PLAN: r0=376(x), r1=191(y), r2=37(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 191
LDI r2, 37
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
