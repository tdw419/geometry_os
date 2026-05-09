; DESCRIPTION: Places a magenta 58x79 rectangle at position (189, 78).
; PLAN: r0=189(x), r1=78(y), r2=58(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 78
LDI r2, 58
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
