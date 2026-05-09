; DESCRIPTION: Places a magenta 25x28 rectangle at position (97, 85).
; PLAN: r0=97(x), r1=85(y), r2=25(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 85
LDI r2, 25
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
