; DESCRIPTION: Places a magenta 29x102 rectangle at position (139, 49).
; PLAN: r0=139(x), r1=49(y), r2=29(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 49
LDI r2, 29
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
