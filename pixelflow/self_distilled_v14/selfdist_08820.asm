; DESCRIPTION: Places a magenta 35x56 box at position (131, 117).
; PLAN: r0=131(x), r1=117(y), r2=35(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 117
LDI r2, 35
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
