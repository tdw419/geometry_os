; DESCRIPTION: Places a magenta 97x59 box at position (18, 2).
; PLAN: r0=18(x), r1=2(y), r2=97(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 2
LDI r2, 97
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
