; DESCRIPTION: Places a magenta 79x111 box at position (170, 61).
; PLAN: r0=170(x), r1=61(y), r2=79(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 61
LDI r2, 79
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
