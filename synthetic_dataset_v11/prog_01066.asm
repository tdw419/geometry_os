; DESCRIPTION: Places a magenta 86x94 rectangle at position (94, 156).
; PLAN: r0=94(x), r1=156(y), r2=86(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 156
LDI r2, 86
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
