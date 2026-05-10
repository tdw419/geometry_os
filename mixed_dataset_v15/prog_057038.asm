; DESCRIPTION: Places a magenta 58x31 box at position (353, 196).
; PLAN: r0=353(x), r1=196(y), r2=58(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 196
LDI r2, 58
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
