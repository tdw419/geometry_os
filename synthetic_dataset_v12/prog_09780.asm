; DESCRIPTION: Places a magenta 45x53 rectangle at position (311, 135).
; PLAN: r0=311(x), r1=135(y), r2=45(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 135
LDI r2, 45
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
