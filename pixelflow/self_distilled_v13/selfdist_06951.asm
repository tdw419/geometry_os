; DESCRIPTION: Places a magenta 53x56 box at position (151, 26).
; PLAN: r0=151(x), r1=26(y), r2=53(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 26
LDI r2, 53
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
