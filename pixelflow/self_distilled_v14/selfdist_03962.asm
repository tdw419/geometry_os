; DESCRIPTION: Places a magenta 49x102 box at position (263, 80).
; PLAN: r0=263(x), r1=80(y), r2=49(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 80
LDI r2, 49
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
