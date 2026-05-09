; DESCRIPTION: Places a magenta 53x22 rectangle at position (264, 93).
; PLAN: r0=264(x), r1=93(y), r2=53(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 93
LDI r2, 53
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
