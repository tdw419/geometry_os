; DESCRIPTION: Places a magenta 66x22 rectangle at position (163, 18).
; PLAN: r0=163(x), r1=18(y), r2=66(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 18
LDI r2, 66
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
