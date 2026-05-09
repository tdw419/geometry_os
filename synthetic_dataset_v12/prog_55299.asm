; DESCRIPTION: Places a magenta 57x56 rectangle at position (31, 115).
; PLAN: r0=31(x), r1=115(y), r2=57(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 115
LDI r2, 57
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
