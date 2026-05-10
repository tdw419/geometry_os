; DESCRIPTION: Places a magenta 14x70 rectangle at position (319, 122).
; PLAN: r0=319(x), r1=122(y), r2=14(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 122
LDI r2, 14
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
