; DESCRIPTION: Places a magenta 58x26 rectangle at position (105, 185).
; PLAN: r0=105(x), r1=185(y), r2=58(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 185
LDI r2, 58
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
