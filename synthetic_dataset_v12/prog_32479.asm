; DESCRIPTION: Places a magenta 115x87 rectangle at position (97, 109).
; PLAN: r0=97(x), r1=109(y), r2=115(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 109
LDI r2, 115
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
