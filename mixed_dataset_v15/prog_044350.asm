; DESCRIPTION: Places a magenta 47x17 box at position (163, 5).
; PLAN: r0=163(x), r1=5(y), r2=47(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 5
LDI r2, 47
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
