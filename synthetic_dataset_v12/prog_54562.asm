; DESCRIPTION: Places a magenta 12x104 rectangle at position (451, 108).
; PLAN: r0=451(x), r1=108(y), r2=12(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 108
LDI r2, 12
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
