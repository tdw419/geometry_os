; DESCRIPTION: Places a magenta 63x99 rectangle at position (7, 82).
; PLAN: r0=7(x), r1=82(y), r2=63(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 82
LDI r2, 63
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
