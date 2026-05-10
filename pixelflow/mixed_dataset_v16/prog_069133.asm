; DESCRIPTION: Places a magenta 13x97 rectangle at position (318, 97).
; PLAN: r0=318(x), r1=97(y), r2=13(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 97
LDI r2, 13
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
