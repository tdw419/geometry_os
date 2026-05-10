; DESCRIPTION: Places a magenta 119x48 rectangle at position (311, 48).
; PLAN: r0=311(x), r1=48(y), r2=119(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 48
LDI r2, 119
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
