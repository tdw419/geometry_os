; DESCRIPTION: Places a magenta 115x39 rectangle at position (78, 87).
; PLAN: r0=78(x), r1=87(y), r2=115(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 87
LDI r2, 115
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
