; DESCRIPTION: Places a magenta 115x58 rectangle at position (114, 99).
; PLAN: r0=114(x), r1=99(y), r2=115(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 99
LDI r2, 115
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
