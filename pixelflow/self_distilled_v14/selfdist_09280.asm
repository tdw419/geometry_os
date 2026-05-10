; DESCRIPTION: Places a magenta 12x35 box at position (139, 172).
; PLAN: r0=139(x), r1=172(y), r2=12(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 172
LDI r2, 12
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
