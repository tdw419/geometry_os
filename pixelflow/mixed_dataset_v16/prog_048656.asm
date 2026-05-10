; DESCRIPTION: Places a magenta 113x108 rectangle at position (343, 110).
; PLAN: r0=343(x), r1=110(y), r2=113(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 110
LDI r2, 113
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
