; DESCRIPTION: Places a magenta 97x63 box at position (68, 164).
; PLAN: r0=68(x), r1=164(y), r2=97(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 164
LDI r2, 97
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
