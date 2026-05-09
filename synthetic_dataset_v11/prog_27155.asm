; DESCRIPTION: Places a magenta 40x94 rectangle at position (134, 87).
; PLAN: r0=134(x), r1=87(y), r2=40(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 87
LDI r2, 40
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
