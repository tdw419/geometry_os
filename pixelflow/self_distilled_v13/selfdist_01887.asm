; DESCRIPTION: Places a magenta 53x44 box at position (349, 70).
; PLAN: r0=349(x), r1=70(y), r2=53(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 70
LDI r2, 53
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
