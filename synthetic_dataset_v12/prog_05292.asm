; DESCRIPTION: Places a magenta 75x92 rectangle at position (311, 17).
; PLAN: r0=311(x), r1=17(y), r2=75(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 17
LDI r2, 75
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
