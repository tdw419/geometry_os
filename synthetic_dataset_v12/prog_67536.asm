; DESCRIPTION: Places a magenta 40x48 rectangle at position (311, 79).
; PLAN: r0=311(x), r1=79(y), r2=40(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 79
LDI r2, 40
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
