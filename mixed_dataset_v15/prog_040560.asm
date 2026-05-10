; DESCRIPTION: Places a magenta 99x106 box at position (84, 15).
; PLAN: r0=84(x), r1=15(y), r2=99(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 15
LDI r2, 99
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
