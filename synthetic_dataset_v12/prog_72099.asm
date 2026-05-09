; DESCRIPTION: Places a magenta 66x72 rectangle at position (115, 78).
; PLAN: r0=115(x), r1=78(y), r2=66(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 78
LDI r2, 66
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
