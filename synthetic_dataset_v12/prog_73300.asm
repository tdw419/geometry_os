; DESCRIPTION: Places a magenta 53x119 rectangle at position (431, 39).
; PLAN: r0=431(x), r1=39(y), r2=53(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 39
LDI r2, 53
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
