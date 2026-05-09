; DESCRIPTION: Places a magenta 63x58 rectangle at position (188, 156).
; PLAN: r0=188(x), r1=156(y), r2=63(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 156
LDI r2, 63
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
